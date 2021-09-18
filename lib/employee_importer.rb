# frozen_string_literal: true

class EmployeeImporter
  class InvalidFileError < StandardError; end

  class FileValidationError < StandardError; end

  EXPECTED_HEADER = [
    "first name", "last name", "company", "clients"
  ].freeze

  def initialize(stream)
    @stream = stream
  end

  def call
    data = parse_stream_data

    validate_header(data[:header])
    validate_values(data[:values])

    create_employees(data)
  end

  private

  def parse_stream_data
    excel = Roo::Spreadsheet.open @stream, extension: :xlsx
    rows = (excel.first_row..excel.last_row).to_a.map { excel.row(_1) }

    { header: rows[0], values: rows[1..] }
  rescue Zip::Error
    raise InvalidFileError, "Uploaded file is not a valid Excel file"
  end

  def validate_header(header)
    return if header.map(&:downcase).sort == EXPECTED_HEADER.sort

    raise FileValidationError, "Header does not consist of #{EXPECTED_HEADER.join(', ')}"
  end

  def validate_values(values)
    return if values.present? && values.flatten.present?

    raise FileValidationError, "Excel does not contain any employees"
  end

  def create_employees(data)
    header = data.fetch(:header)
    values = data.fetch(:values)

    Employee.transaction do
      values.each_with_index { |v, i| create_employee(header, v, i + 2) }
    end
  end

  def create_employee(header, employee_data, row_idx)
    return if employee_data.compact.blank?

    Employee.create!(
      first_name: retrieve_first_name(header, employee_data),
      last_name: retrieve_last_name(header, employee_data),
      company: retrieve_company(header, employee_data, row_idx),
      consultants: retrieve_clients_with_consultants(header, employee_data, row_idx)
    )
  rescue ActiveRecord::RecordInvalid => e
    raise FileValidationError, "Error while creating employee in row #{row_idx}: #{e.message}"
  end

  def retrieve_first_name(header, employee_data)
    employee_data[header.map(&:downcase).index("first name")]
  end

  def retrieve_last_name(header, employee_data)
    employee_data[header.map(&:downcase).index("last name")]
  end

  def retrieve_company(header, employee_data, row_idx)
    company_ident = employee_data[header.map(&:downcase).index("company")]

    if company_ident.blank?
      raise FileValidationError, "Error while creating employee in row #{row_idx}: no company given"
    end

    Company.find_by!(identity: company_ident)
  rescue ActiveRecord::RecordNotFound
    raise FileValidationError,
          "Error while creating employee in row #{row_idx}: company #{company_ident} does not exist"
  end

  def retrieve_clients_with_consultants(header, employee_data, row_idx)
    clients = employee_data[header.map(&:downcase).index("clients")]

    return [] if clients.blank?

    clients.split(",").map(&:strip).map do |client_ident|
      Consultant.new(client: Client.find_by!(ctoken: client_ident))
    rescue ActiveRecord::RecordNotFound
      raise FileValidationError,
            "Error while creating employee in row #{row_idx}: client #{client_ident} does not exist"
    end
  end
end

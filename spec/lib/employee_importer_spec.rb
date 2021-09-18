# frozen_string_literal: true

require "rails_helper"
require "employee_importer"

RSpec.describe EmployeeImporter, type: :model do
  context "#import" do
    it "should throw an error if excel cannot be parsed" do
      importer = EmployeeImporter.new(StringIO.new("test"))

      expect { importer.call }.to raise_error(EmployeeImporter::InvalidFileError)
    end

    it "should throw an error if header has a typo" do
      importer = EmployeeImporter.new(file_fixture("header_with_typo.xlsx"))

      expect { importer.call }.to raise_error(EmployeeImporter::FileValidationError)
    end

    it "should throw an error if header is incomplete" do
      importer = EmployeeImporter.new(file_fixture("missing_header.xlsx"))

      expect { importer.call }.to raise_error(EmployeeImporter::FileValidationError)
    end

    it "should throw an error if no data exists" do
      importer = EmployeeImporter.new(file_fixture("empty_file.xlsx"))

      expect { importer.call }.to raise_error(EmployeeImporter::FileValidationError)
    end

    it "should throw an error if data is missing" do
      importer = EmployeeImporter.new(file_fixture("missing_data.xlsx"))

      expect { importer.call }.to raise_error(EmployeeImporter::FileValidationError)
    end

    it "should throw an error if company does not exist" do
      importer = EmployeeImporter.new(file_fixture("valid_excel.xlsx"))

      expect { importer.call }.to raise_error(EmployeeImporter::FileValidationError)
    end

    it "should throw an error if client does not exist" do
      create(:company).tap { |c| c.update!(identity: "abc") }

      importer = EmployeeImporter.new(file_fixture("valid_excel.xlsx"))

      expect { importer.call }.to raise_error(EmployeeImporter::FileValidationError)
    end

    it "should successfully create employees" do
      create(:company).tap { |c| c.update!(identity: "abc") }
      create(:company).tap { |c| c.update!(identity: "def") }
      create(:client).tap { |c| c.update!(ctoken: "abc") }
      create(:client).tap { |c| c.update!(ctoken: "def") }

      importer = EmployeeImporter.new(file_fixture("valid_excel.xlsx"))

      importer.call

      expect(Employee.count).to eq(3)

      paul = Employee.find_by!(first_name: "Paul")

      expect(paul.last_name).to eq("Peter")
      expect(paul.company.identity).to eq("abc")
      expect(paul.clients.count).to eq(2)
    end
  end
end

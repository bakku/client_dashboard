# frozen_string_literal: true

class Consultant < ApplicationRecord
  belongs_to :client
  belongs_to :contractor, optional: true
  belongs_to :employee, optional: true

  def full_name
    if contractor.present?
      "#{contractor.first_name} #{contractor.last_name}"
    else
      "#{employee.first_name} #{employee.last_name}"
    end
  end

  def company_name
    if contractor.present?
      contractor.partner_company.name
    else
      employee.company.name
    end
  end
end

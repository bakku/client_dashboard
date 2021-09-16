# frozen_string_literal: true

json.extract! employee, :id, :identifier, :first_name, :last_name, :company_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)

# frozen_string_literal: true

json.extract! contractor, :id, :first_name, :last_name, :partner_company_id, :created_at, :updated_at
json.url contractor_url(contractor, format: :json)

# frozen_string_literal: true

json.extract! partner_company, :id, :identity, :name, :created_at, :updated_at
json.url partner_company_url(partner_company, format: :json)

# frozen_string_literal: true

FactoryBot.define do
  factory :contractor do
    first_name { "First Name" }
    last_name { "Last Name" }
    partner_company
  end
end

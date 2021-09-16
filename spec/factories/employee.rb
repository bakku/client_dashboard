# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    first_name { "First Name" }
    last_name { "Last Name" }
    identifier { "AB-CD-EF" }
    company
  end
end

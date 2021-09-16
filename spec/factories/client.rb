# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    first_name { "First Name" }
    last_name { "Last Name" }
    ctoken { "AB-CD-DE" }
  end
end

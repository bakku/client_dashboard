# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { "Company Name" }
    identity { "ABCD:EFGH" }
  end
end

# frozen_string_literal: true

class PartnerCompany < ApplicationRecord
  has_many :contractors, dependent: :destroy
  has_many :clients, through: :contractors

  validates :name, presence: true
  validates :identity, presence: true, uniqueness: true

  before_validation :generate_token, on: :create

  def client_ids
    clients.pluck(:id)
  end

  def contractor_ids
    contractors.pluck(:id)
  end

  private

  def generate_token
    loop do
      self.identity = SimpleTokenGenerator::Generator.call(prefix: "P/")
      break unless self.class.exists?(identity: identity)
    end
  end
end

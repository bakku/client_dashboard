# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :clients, through: :employees

  validates :name, presence: true
  validates :identity, presence: true, uniqueness: true

  before_validation :generate_token, on: :create

  def employee_ids
    employees.pluck(:id)
  end

  def client_ids
    clients.pluck(:id)
  end

  def contractor_ids
    Contractor.for_given_clients(client_ids).pluck(:id)
  end

  private

  def generate_token
    loop do
      self.identity = SimpleTokenGenerator::Generator.call
      break unless self.class.exists?(identity: identity)
    end
  end
end

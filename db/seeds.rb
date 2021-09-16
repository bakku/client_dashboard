# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[Client, Consultant, Company, PartnerCompany, Employee, Contractor].each(&:destroy_all)

1000.times do
  client = Client.new
  client.first_name = Faker::Name.first_name
  client.last_name = Faker::Name.last_name
  client.save!
end

100.times do
  partner_company = PartnerCompany.create!(name: Faker::Company.unique.name)
  rand(10).times do
    contractor = Contractor.new
    contractor.partner_company_id = partner_company.id
    contractor.first_name = Faker::Name.first_name
    contractor.last_name = Faker::Name.last_name
    clients = []
    rand(3).times do
      clients << Client.all.sample
    end
    contractor.clients = clients.uniq
    contractor.save!
  end
end

100.times do
  company = Company.create!(name: Faker::Company.unique.name)
  rand(10).times do
    employee = Employee.new
    employee.company_id = company.id
    employee.first_name = Faker::Name.first_name
    employee.last_name = Faker::Name.last_name
    clients = []
    rand(3).times do
      clients << Client.all.sample
    end
    employee.clients = clients.uniq
    employee.save!
  end
end

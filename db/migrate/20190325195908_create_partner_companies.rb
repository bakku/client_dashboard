# frozen_string_literal: true

class CreatePartnerCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :partner_companies do |t|
      t.string :identity
      t.string :name

      t.timestamps
    end
  end
end

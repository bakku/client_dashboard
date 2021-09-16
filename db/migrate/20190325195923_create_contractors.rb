# frozen_string_literal: true

class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :partner_company, foreign_key: true

      t.timestamps
    end
  end
end

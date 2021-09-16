# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :identifier
      t.string :first_name
      t.string :last_name
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end

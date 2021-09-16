# frozen_string_literal: true

class CreateConsultants < ActiveRecord::Migration[5.2]
  def change
    create_table :consultants do |t|
      t.belongs_to :client, foreign_key: true
      t.belongs_to :contractor, foreign_key: true
      t.belongs_to :employee, foreign_key: true

      t.timestamps
    end
  end
end

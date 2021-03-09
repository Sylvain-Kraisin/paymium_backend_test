# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :btc_balance
      t.integer :eur_balance

      t.timestamps
    end
  end
end

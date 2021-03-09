# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :direction
      t.integer :btc_amount
      t.integer :price
      t.string :state

      t.timestamps
    end
  end
end

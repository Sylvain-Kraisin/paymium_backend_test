# frozen_string_literal: true

class CreateQueuedOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :queued_orders do |t|
      t.integer :user_id
      t.string :direction
      t.integer :btc_amount
      t.integer :price

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class AddIndexToOrders < ActiveRecord::Migration[6.1]
  def change
    add_index :queued_orders, :user_id, unique: true
    add_index :orders, :user_id, unique: true
  end
end

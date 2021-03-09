# frozen_string_literal: true

class User < ApplicationRecord
  has_many :queued_orders
  has_many :orders
end

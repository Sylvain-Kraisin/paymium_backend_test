# frozen_string_literal: true

class QueuedOrder < ApplicationRecord
  belongs_to :user
  after_create :search_for_match

  scope :buyers, -> { where(direction:'buy') }
  scope :sellers, -> { where(direction:'sell') }


  def search_for_match
    if for_sell?
      SearchQueueOrderBuyerWorker.perform_async(id, 5)
    else
      SearchQueueOrderSellerWorker(id, 5)
    end
  end

  def for_sell?
    direction == 'sell'
  end
end

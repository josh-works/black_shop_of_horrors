class Invoice < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :order
  belongs_to :item

  def item
    Item.find(item_id)
  end

  def item_cost
    item.format_price
  end

  def quantity_cost
    number_to_currency(item.price * quantity)
  end

  def total_cost_unformatted
    item.price * quantity
  end
end

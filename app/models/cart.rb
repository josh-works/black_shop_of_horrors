class Cart
  include ActionView::Helpers::NumberHelper

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def clear
    contents.clear
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def items
    contents.keys.map { |id| Item.find(id) }
  end

  def delete(key)
    contents.delete(key.to_s)
  end

  def total_cost
    number_to_currency(contents.reduce(0) do |sum, item|
      sum += (Item.find(item.first).price * item.last)
    end)
  end

  def cart_items
    contents.map { |id, quantity| CartItem.new(id, quantity) }
  end
end

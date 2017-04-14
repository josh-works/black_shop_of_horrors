class CartItem < SimpleDelegator
  include ActionView::Helpers::NumberHelper
  attr_reader :id, :quantity

  def initialize(id, quantity)
    @id = id
    @quantity = quantity
    super(Item.find(id))
  end

  def subtotal
    number_to_currency(price * quantity)
  end
end

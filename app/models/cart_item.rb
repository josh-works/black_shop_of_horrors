class CartItem < SimpleDelegator
  attr_reader :id, :quantity
  def initialize(id, quantity)
    @id = id
    @quantity = quantity
    super(Item.find(id))
  end

  def subtotal
    price * quantity
  end
end

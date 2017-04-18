class PaymentsController < ApplicationController
  def index
    if @cart.total_count > 0
      @order = current_user.orders.create
      @cart.cart_items.each do |item|
        @order.invoices.create(item_id: item.id, quantity: item.quantity)
      end
    else
      flash[:notice] = "You have no illegal goods in your black market cart"
      redirect_to cart_path
    end
  end

  def create
    @order = current_user.orders.last
    flash[:notice] = "Your order was successful"
    redirect_to order_path(@order)
  end
end

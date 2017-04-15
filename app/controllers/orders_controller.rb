class OrdersController < ApplicationController
  def create
    @order = current_user.orders.create
    @cart.cart_items.each do |item|
      @order.invoices.create(item_id: item.id, quantity: item.quantity)
    end
    
    redirect_to order_path(@order)
  end

  def index
    if current_user
      @cart.clear
      @orders = current_user.orders
    else
      redirect_to login_path
    end
  end

  def show
    if current_user
      @cart.clear
      @orders = current_user.orders
    else
      redirect_to login_path
    end
  end
end

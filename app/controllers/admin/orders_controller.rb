class Admin::OrdersController < Admin::BaseController

  def all
    @orders = Order.order(id: :desc)
  end

  def completed
    @orders = Order.where(status: "completed")
  end

  def paid
    @orders = Order.where(status: "paid")
  end

  def ordered
    @orders = Order.where(status: "ordered")
  end

  def cancelled
    @orders = Order.where(status: "cancelled")
  end

  def update
    @order = Order.find(params[:id])
    # binding.pry
    @order.update(status: params[:status])
    redirect_to admin_orders_path
  end

end

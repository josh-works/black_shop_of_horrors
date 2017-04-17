class Admin::OrdersController < Admin::BaseController

  def all
    @orders = Order.all
  end

end

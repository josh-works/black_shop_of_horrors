class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to category_path(item.category)
  end

  def show
    @cart_item = @cart.cart_items
  end

  def index
    @cart_item = @cart.cart_items
  end

  def destroy
    item_id = params[:item_id]
    @cart.delete(item_id)
    redirect_to cart_path
  end
end

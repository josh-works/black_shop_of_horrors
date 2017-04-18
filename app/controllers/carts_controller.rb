class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_back(fallback_location: items_path)
  end

  def show
    @cart_item = @cart.cart_items
  end

  def destroy
    item_id = params[:item_id]
    flash[:removed] = "Successfully removed #{view_context.link_to(Item.find(item_id).title, item_path(item_id))} from cart!"
    @cart.delete(item_id)
    redirect_to cart_path
  end

  def update
    if params[:quantity] == "+"
      @cart.contents[params[:item_id]] += 1
    else
      @cart.contents[params[:item_id]] -= 1 unless @cart.contents[params[:item_id]] == 0
    end
    redirect_to cart_path
  end
end

class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    binding.pry

    @cart.add_item(item.id)
    # item.quantity = params[:quantity] if params[:quantity]
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to category_path(item.category)
  end

  def show
    @cart_item = @cart.cart_items
  end

  def destroy
    item_id = params[:item_id]
    flash[:removed] = %Q[<a href="/item/#{item_id}">#{Item.find(item_id).title}</a> removed from Cart]
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

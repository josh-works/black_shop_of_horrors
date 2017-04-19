class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def edit
    @item = Item.find(params[:id])
  end

private
  def item_params
    params.require(:item).permit(:title, :description, :image, :status, :price)
  end
end

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:category_slug])
    @items = @category.items.where(status: 0)
  end
end

class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:category_slug])

    @items = @category.items
  end

  private

  def category_params
    params.require(:category).permit(:title, :image)
  end
end

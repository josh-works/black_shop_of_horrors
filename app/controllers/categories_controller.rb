class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      # binding.pry
      redirect_to category_path(@category)
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:category_slug])
    # if params[:category_slug] == "/cart"
    #   redirect_to cart_path
    # end
    @items = @category.items
  end

  private

  def category_params
    params.require(:category).permit(:title, :image)
  end
end

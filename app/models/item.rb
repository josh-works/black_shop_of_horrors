class Item < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :category

  validates :title, :description, :price, :image, presence: true
  validates :image, uniqueness: true


  def format_price
    number_to_currency(price)
  end
end

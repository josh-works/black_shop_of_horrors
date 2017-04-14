class Item < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :category
  has_many :invoices
  has_many :orders, through: :invoices
  
  validates :title, :description, :price, :image, presence: true
  validates :image, uniqueness: true


  def format_price
    number_to_currency(price)
  end
end

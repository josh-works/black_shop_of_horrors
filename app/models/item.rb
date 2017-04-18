class Item < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :category
  has_many :invoices
  has_many :orders, through: :invoices

  validates :title, :description, :price, :image, presence: true
  validates :image, uniqueness: true

  enum status: %w(Active Retired)

  def format_price
    number_to_currency(price)
  end

  # def count_in_cart
  #   @order.items.where(id: self.id).count
  # end
end

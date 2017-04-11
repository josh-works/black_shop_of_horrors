class Item < ApplicationRecord
  belongs_to :category
  # belongs_to :package
  validates :title, :description, :price, :image, presence: true
  validates :image, uniqueness: true
end

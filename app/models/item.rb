class Item < ApplicationRecord
  belongs_to :category

  validates :title, :description, :price, :image, presence: true
  validates :image, uniqueness: true
end

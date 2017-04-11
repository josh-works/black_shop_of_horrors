class Category < ApplicationRecord
  has_many :items
  validates :title, :image, presence: true, uniqueness: true
  has_many :items
end

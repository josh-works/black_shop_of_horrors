class Category < ApplicationRecord
  has_many :items
  validates :title, :image, presence: true, uniqueness: true
end

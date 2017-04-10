class Category < ApplicationRecord
  validates :title, :image, presence: true, uniqueness: true
  has_many :items
end

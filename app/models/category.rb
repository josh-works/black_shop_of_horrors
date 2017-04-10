class Category < ApplicationRecord
  validates :title, :image, presence: true, uniqueness: true
end

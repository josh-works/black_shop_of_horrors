class Category < ApplicationRecord
  has_many :items
  validates :title, :image, presence: true, uniqueness: true
  has_many :items

  before_save :create_slug

  def create_slug
    self.slug = self.title.parameterize
  end

  def to_param
    slug
  end
end

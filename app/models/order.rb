class Order < ApplicationRecord
  belongs_to :user
  has_many :invoices
  has_many :items, through: :invoices

end

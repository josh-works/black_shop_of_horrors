class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :email,
            :first_name,
            :last_name,
            presence: true

  validates :email,
             uniqueness: true

  enum role: %w(default admin)
end

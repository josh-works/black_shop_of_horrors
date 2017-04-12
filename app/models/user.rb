class User < ApplicationRecord
  has_secure_password

  validates :email,
            :first_name,
            :last_name,
            :password,
            :password_confirmation,
            presence: true
            
  validates :email,
             uniqueness: true

  enum role: %w(default admin)
end

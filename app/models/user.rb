class User < ApplicationRecord
  has_secure_password
  validates :email, confirmation: true, presence: true, uniqueness: true
  validates :username, presence: true, allow_blank: false
  validates :password, presence: true
end

class User < ApplicationRecord
  has_many :links
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, allow_blank: false
  validates :password, confirmation: true, presence: true
end

class Tag < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :link_tags
  has_many :links, through: :link_tags
end

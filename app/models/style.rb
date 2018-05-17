class Style < ApplicationRecord
  has_many :pieces
  has_many :products, through: :pieces

  validates :name, uniqueness: true
end

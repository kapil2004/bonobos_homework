class Product < ApplicationRecord
  has_many :pieces
  has_many :styles, through: :pieces
end

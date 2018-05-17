class Piece < ApplicationRecord
  belongs_to :style
  belongs_to :product
end

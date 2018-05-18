class Piece < ApplicationRecord
  belongs_to :style
  belongs_to :product

  def style_name
    style.name
  end
end

class Product < ApplicationRecord
  has_many :pieces
  has_many :styles, through: :pieces

  def self.search(term)
    return nil if term.blank?

    where(name: term).first || fuzzy_match(term)
  end

  private

  def self.fuzzy_match(term)
    percent_match = {}

    Product.select(:id, :name).all.each do |product|
      count = term.chars.inject(0){ |sum, char| product.name.include?(char) ? sum += 1 : sum }
      percent_match[product.id] = (count * 100 / product.name.length).floor
    end

    best_match_id = percent_match.max_by{ |pid, match_pc| match_pc }[0]

    find(best_match_id)
  end

end

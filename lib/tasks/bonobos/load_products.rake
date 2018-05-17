require 'csv'

namespace :bonobos do
  desc 'Load products and inventory from csv files'
  task load_products: :environment do
    csv_options = { headers: true, header_converters: :symbol, col_sep: ', ', converters: :numeric}

    puts "\nCreating products "
    products_file = File.join(Rails.root, 'db', 'data', 'products.csv')
    CSV.foreach(products_file, csv_options).each do |product_row|
      product_row = product_row.to_hash
      Product.create!(
        id: product_row[:product_id],
        name: product_row[:product_name],
        image: product_row[:product_image],
        description: product_row[:product_description],
      )
      print '.'
    end

    puts "\nCreating pieces from inventory "
    inventory_file = File.join(Rails.root, 'db', 'data', 'inventory.csv')
    CSV.foreach(inventory_file, csv_options).each do |inventory_row|
      piece = inventory_row.to_hash
      piece[:style] = Style.find_or_create_by(name: piece.delete(:style))
      Piece.create!(piece)
      print '.'
    end

    puts
  end
end

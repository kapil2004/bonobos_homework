class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.references :product, index: true
      t.references :style, index: true
      t.integer :waist
      t.integer :length
      t.integer :count, default: 0
    end
  end
end

class CreateStockLevels < ActiveRecord::Migration
  def change
    create_table :stock_levels do |t|
      t.references :product
      t.references :stock_location
      t.integer :quanity
      t.integer :threshold

      t.timestamps
    end
    add_index :stock_levels, :product_id
    add_index :stock_levels, :stock_location_id
  end
end

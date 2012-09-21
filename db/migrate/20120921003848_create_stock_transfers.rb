class CreateStockTransfers < ActiveRecord::Migration
  def change
    create_table :stock_transfers do |t|
      t.references :product
      t.references :stock_location
      t.integer :quantity
      t.boolean :complete

      t.timestamps
    end
    add_index :stock_transfers, :product_id
    add_index :stock_transfers, :stock_location_id
  end
end

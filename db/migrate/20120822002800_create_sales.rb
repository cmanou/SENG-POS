class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :product
      t.references :transaction
      t.integer :quantity
      t.decimal :discount

      t.timestamps
    end
    add_index :sales, :product_id
    add_index :sales, :transaction_id
  end
end

class CreateSupplierStockOrders < ActiveRecord::Migration
  def change
    create_table :supplier_stock_orders do |t|
      t.references :product
      t.integer :quantity
      t.string :status

      t.timestamps
    end
    add_index :supplier_stock_orders, :product_id
  end
end

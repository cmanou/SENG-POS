class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.references :sale
      t.references :product
      t.integer :quantity
      t.decimal :sub_total
      
      t.timestamps
    end
    add_index :sale_items, :sale_id
    add_index :sale_items, :product_id
  end
end

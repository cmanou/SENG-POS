class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :supplier
      t.string :barcode
      t.string :name
      t.string :brand
      t.string :size
      t.text :description
      t.decimal :cost
      t.decimal :price
      t.string :active
      
      t.timestamps
    end
      add_index :products, :barcode
  end
end

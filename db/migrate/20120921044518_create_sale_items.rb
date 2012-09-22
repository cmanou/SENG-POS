class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.integer :quantity
      t.belongs_to :sale
      t.belongs_to :product

      t.timestamps
    end
  end
end

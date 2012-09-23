class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :customer
      t.references :checkout_user
      t.decimal :discount
      
      t.timestamps
    end
    add_index :sales, :customer_id
    add_index :sales, :checkout_user_id
  end
end

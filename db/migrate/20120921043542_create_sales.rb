class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :customer_id
      t.integer :checkout_user_id

      t.timestamps
    end
  end
end

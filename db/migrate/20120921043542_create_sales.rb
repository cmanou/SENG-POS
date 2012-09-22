class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.belongs_to :customer
      t.belongs_to :checkout_user

      t.timestamps
    end
  end
end

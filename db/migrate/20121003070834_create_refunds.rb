class CreateRefunds < ActiveRecord::Migration
  def change
    create_table :refunds do |t|
      t.references :sale_item
      t.references :checkout_user
      t.integer :quantity
      t.text :reason
      t.decimal :total

      t.timestamps
    end
    add_index :refunds, :sale_item_id
    add_index :refunds, :checkout_user_id
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :sale
      t.decimal :amount
      t.string :method
      t.boolean :approved

      t.timestamps
    end
    add_index :transactions, :sale_id
  end
end

class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :brand, :string
    add_column :products, :size, :decimal
    add_column :products, :active, :boolean
  end
end

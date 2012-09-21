class AddSupplierToProducts < ActiveRecord::Migration
  def change
    add_column :products, :supplier_id, :integer, :references=>"suppliers"
  end
end

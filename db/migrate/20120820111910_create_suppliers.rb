class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :contact_person
      t.string :contact_number

      t.timestamps
    end
  end
end

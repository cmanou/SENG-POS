class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :postcode, :integer
    add_column :users, :discount, :decimal
    add_column :users, :membership, :string
    add_column :users, :active, :boolean
  end
end

class AddPreviousLocationToStockLocation < ActiveRecord::Migration
  def change
    add_column :stock_locations, :previous_location_id, :integer
  end
end

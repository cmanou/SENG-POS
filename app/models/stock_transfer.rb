class StockTransfer < ActiveRecord::Base
  belongs_to :product
  belongs_to :stock_location
  attr_accessible :complete, :quantity, :timestamps
end

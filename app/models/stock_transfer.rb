class StockTransfer < ActiveRecord::Base
  belongs_to :product
  belongs_to :stock_location
  attr_accessible :product, :stock_location, :complete, :quantity

   validates :product, :stock_location, :quantity, :presence => true
   validates :quantity, :numericality => {:greater_than => 0}

end

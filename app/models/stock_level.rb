class StockLevel < ActiveRecord::Base
  belongs_to :product
  belongs_to :stock_location
  attr_accessible :quanity, :threshold,:product, :stock_location
end

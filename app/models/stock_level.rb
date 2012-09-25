class StockLevel < ActiveRecord::Base
  belongs_to :product
  belongs_to :stock_location
  attr_accessible :quantity, :threshold, :product, :stock_location


  def below 
  	quantity < threshold
  end
end

class StockLevel < ActiveRecord::Base
  belongs_to :product
  belongs_to :stock_location
  attr_accessible :quantity, :threshold, :product, :stock_location


#threshold is max threshold from eventb model
  validates :quantity, :threshold, :numericality => {:greater_than_or_equal_to => 0}
  validates :quantity, :numericality => {:less_than_or_equal_to => :threshold}


  def below 
  	quantity < threshold
  end
end

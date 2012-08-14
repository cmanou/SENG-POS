class StockLocation < ActiveRecord::Base
  has_many :stock_levels
  has_many :products, :through => :stock_levels
  attr_accessible :name
end

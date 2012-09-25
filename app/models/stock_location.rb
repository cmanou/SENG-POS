class StockLocation < ActiveRecord::Base
  has_many :stock_levels, :dependent => :destroy
  has_many :products, :through => :stock_levels

  has_one :previous_location
  belongs_to :previous_location, :class_name => 'StockLocation'

  attr_accessible :name, :previous_location
end

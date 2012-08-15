class Product < ActiveRecord::Base
  has_many :stock_levels
  has_many :stock_locations, :through => :stock_levels
  attr_accessible :cost, :description, :name, :price, :barcode

  accepts_nested_attributes_for :stock_levels
end

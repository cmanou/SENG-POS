class Product < ActiveRecord::Base
  has_many :stock_levels, :dependent => :destroy
  has_many :stock_locations, :through => :stock_levels
  has_many :sales
  has_many :transactions, :through => :sales
  belongs_to :supplier
  attr_accessible :cost, :description, :name, :price, :barcode, :supplier
end

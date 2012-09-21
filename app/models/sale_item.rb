class SaleItem < ActiveRecord::Base
    belongs_to :sale
    belongs_to :product
  attr_accessible :quantity
end

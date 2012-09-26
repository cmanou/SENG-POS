class SupplierStockOrder < ActiveRecord::Base
  belongs_to :product
  attr_accessible :quantity, :status
end

class SupplierStockOrder < ActiveRecord::Base
  belongs_to :product
  attr_accessible :product, :quantity, :status

  validates :status,
       :inclusion  => { :in => [ 'Created', 'Processed', 'Completed'],
       :message    => "%{value} is not a valid status" }
end

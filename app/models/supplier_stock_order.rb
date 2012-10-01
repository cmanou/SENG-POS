class SupplierStockOrder < ActiveRecord::Base
  belongs_to :product
  attr_accessible :product, :quantity, :status

  validates :status,
       :inclusion  => { :in => [ 'Created', 'Processed', 'Completed'],
       :message    => "%{value} is not a valid status" }

  validates :product, :quantity, :status, :presence => true
  validates :quantity, :numericality => {:greater_than => 0}


  def total
  	quantity * product.cost
  end
end

class SaleItem < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product

  attr_accessible :sale, :product, :quantity, :sub_total

  #validates :product_active, :inclusion  => { :in => [true, false], :message    => "%{product} is not active" }
end

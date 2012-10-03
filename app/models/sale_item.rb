class SaleItem < ActiveRecord::Base
  #Event-B: CART = PRODUCT ⇸ ℕ
  #Summary: This class represents the cart set from our model
  belongs_to :sale
  belongs_to :product

  attr_accessible :sale, :product, :quantity, :sub_total
#This has to be fixed
  #validates :product_active, :inclusion  => { :in => [true, false], :message    => "%{product} is not active" }
end

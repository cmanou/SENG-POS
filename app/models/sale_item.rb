class SaleItem < ActiveRecord::Base
  #Event-B: CART = PRODUCT ⇸ ℕ
  #Summary: This class represents the cart set from our model
  belongs_to :sale
  belongs_to :product

  attr_accessible :sale, :product, :quantity, :sub_total
  validates_presence_of :sale, :product, :quantity

  validate :product_is_active

  def product_is_active
      errors.add(:product, "is not active") unless product.active == 't'
  end
end

class SaleItem < ActiveRecord::Base
    belongs_to :sale
    belongs_to :product

  attr_accessible :quantity, :product

  def sub_total
    product.price * quantity
  end
end

class SaleItem < ActiveRecord::Base
  #Event-B: CART = PRODUCT ⇸ ℕ
  #Summary: This class represents the cart set from our model
  belongs_to :sale
  belongs_to :product

  attr_accessible :sale, :product, :quantity, :sub_total
  validates_presence_of :sale, :product, :quantity

  validate :product_is_active
  validate :deduct_stock
  before_destroy :restore_stock

  def stock_level
    if @stock_level.nil?
      @stock_level = StockLevel.find_by_product_id_and_stock_location_id(product, StockLocation.where(:name => 'Floor'))
    end
    return @stock_level
  end

  def product_is_active
    errors.add(:product, "is not active") unless product.active == 't'
  end

  def deduct_stock
    if quantity_changed? and quantity_was
      stock_level.quantity += quantity_was
    end
    stock_level.quantity -= quantity
    if stock_level.quantity >= 0
      stock_level.save!
    else
      errors.add(:quantity, "cannot exceed current floor stock")
      return false
    end
  end

  def restore_stock
    stock_level.quantity += quantity
    stock_level.save
  end
end

class Refund < ActiveRecord::Base
  belongs_to :sale_item
  belongs_to :checkout_user, :class_name => 'User'
  
  has_one :products, :through => :sale_items
  has_one :sale, :through => :sale_items
  
  attr_accessible :quantity, :reason
  
  validate :stock_not_already_returned
  
  def stock_not_already_returned
    @refunds = Refund.find_all_by_sale_item_id(sale_item.id)
    @quantity_returned = @refunds.sum(&:quantity)
    @quantity_available = sale_item.quantity - @quantity_returned
    if sale_item.quantity == 0
      errors.add(:base, 'Product was not found in sale')
    elsif quantity > @quantity_available
      errors.add(:quantity, "of item return is too high. There are only #{@quantity_available} item(s) of this product available to be returned")
    end
  end
  
end

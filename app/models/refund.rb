class Refund < ActiveRecord::Base
  belongs_to :sale_item
  belongs_to :checkout_user, :class_name => 'User'
  
  has_one :products, :through => :sale_items
  has_one :sale, :through => :sale_items
  
  attr_accessible :quantity, :reason
end

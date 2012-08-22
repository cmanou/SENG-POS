class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :transaction
  attr_accessible :discount, :quantity
end

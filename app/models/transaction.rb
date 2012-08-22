class Transaction < ActiveRecord::Base
  has_many :sales
  has_many :products, :through => :sales
  attr_accessible :amount, :approved, :method
end

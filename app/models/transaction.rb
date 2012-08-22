class Transaction < ActiveRecord::Base
  belongs_to :sale
  attr_accessible :amount, :approved, :method
end

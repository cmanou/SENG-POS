class Sale < ActiveRecord::Base
    has_many :sale_items
    has_many :products, :through => :sale_items

    belongs_to :customer, :class_name => 'User'
    belongs_to :checkout_user, :class_name => 'User'

    attr_accessible :customer, :checkout_user
end

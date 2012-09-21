class Sale < ActiveRecord::Base
    has_many :sale_items
    has_many :products, :through => :sale_items
end

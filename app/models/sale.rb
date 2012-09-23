class Sale < ActiveRecord::Base
    has_many :sale_items, :dependent => :destroy
    has_many :products, :through => :sale_items

    belongs_to :customer, :class_name => 'User'
    belongs_to :checkout_user, :class_name => 'User'

    validates :status,
       :inclusion  => { :in => [ 'Adding to Cart', 'Checking Out', 'Finished'],
       :message    => "%{value} is not a valid status" }

    attr_accessible :customer, :checkout_user, :discount, :status

    def total
      sale_items.sum(&:sub_total)
    end
    def discount
      0
    end
end

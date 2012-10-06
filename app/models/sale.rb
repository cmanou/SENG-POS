class Sale < ActiveRecord::Base
    has_many :sale_items, :dependent => :destroy
    has_many :products, :through => :sale_items
    has_many :transactions

    belongs_to :customer, :class_name => 'User'
    belongs_to :checkout_user, :class_name => 'User'

    attr_accessible :customer, :checkout_user, :discount, :status

    #Event-B: transactionInProcess ∈ members ⇸TRANSACTIONTYPE
    #         axm3: partition(TRANSACTIONTYPE, {ADDINGTOCART},{CHECKINGOUT},{FINISHED})
    #Comment: These was just renamed but serves the exact same person.

    validates :status,
       :inclusion  => { :in => [ 'Adding to Cart', 'Checking Out', 'Finished'],
       :message    => "%{value} is not a valid status" }


    # Various other methods.
    def total
      sale_items.sum(&:sub_total)
    end

    def amount_paid
      transactions.sum(&:amount)
    end

    def discount
      customer.discount / 100 * total if customer
    end

    def change_given
      [amount_paid - total, 0].max
    end
end

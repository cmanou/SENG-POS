class StockLevel < ActiveRecord::Base
  #Event-B: productmaxthreshold ∈ products → (STOCK_LOCATION → ℕ)
  #Event-B: productlevels ∈ products →(STOCK_LOCATION → ℕ)

  belongs_to :product
  belongs_to :stock_location
  attr_accessible :quantity, :threshold, :product, :stock_location

  # Event-B: ∀p,l · p∈ activeProducts ∧ l ∈ STOCK_LOCATION ⇒ productmaxthreshold(p)(l) ≥ productthreshold(p)(l)
  # Validate that stock_level is above miniumum threshold, and automatically reorder if quantity falls below threshold
  validates :quantity, :threshold, :numericality => {:greater_than_or_equal_to => 0}
  after_save :automatic_reorder

  


  def below
  	quantity < threshold
  end

  def automatic_reorder
    if below
      if stock_location.previous_location
        #stock transfer
        exsting_transfer = StockTransfer.find_by_product_id_and_stock_location_id_and_complete(product, stock_location, false)
        if exsting_transfer
          exsting_transfer.quantity = threshold - quantity
          exsting_transfer.save!
        else
          StockTransfer.create!(
            :product => product,
            :stock_location => stock_location,
            :quantity => threshold - quantity,
            :complete => false
          )
        end
      else
        #supplier stock order
        existing_order = SupplierStockOrder.find_by_product_id_and_status(product, 'Created')
        if existing_order
          existing_order.quantity = threshold - quantity
          existing_order.save!
        else
          SupplierStockOrder.create!(
            :product => product,
            :quantity => threshold - quantity,
            :status => 'Created'
          )
        end
      end
    end
  end
end

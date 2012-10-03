class StockLevel < ActiveRecord::Base
  #Event-B: productmaxthreshold ∈ products → (STOCK_LOCATION → ℕ)
  #Event-B: productlevels ∈ products →(STOCK_LOCATION → ℕ)

  belongs_to :product
  belongs_to :stock_location
  attr_accessible :quantity, :threshold, :product, :stock_location

  validates :quantity, :threshold, :numericality => {:greater_than_or_equal_to => 0}
  validates :quantity, :numericality => {:less_than_or_equal_to => :threshold}

  #Event-B: ∀p,l · p∈ activeProducts ∧ l ∈ STOCK_LOCATION ⇒ productmaxthreshold(p)(l) ≥ productthreshold(p)(l)
  #Need to do it still


  def below 
  	quantity < threshold
  end
end

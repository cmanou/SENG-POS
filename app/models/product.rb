class Product < ActiveRecord::Base
  has_many :stock_levels, :dependent => :destroy
  has_many :stock_locations, :through => :stock_levels
  has_many :sale_items
  has_many :sales, :through => :sale_items
  has_many :transactions, :through => :sales
  has_many :supplier_stock_orders
  belongs_to :supplier
  attr_accessible :cost, :description, :name, :price, :barcode, :supplier, :brand, :size, :active


  validates :name, :description, :price,:brand, :size, :cost, :barcode, :supplier, :presence => true

  validates :price, :cost, :numericality => {:greater_than_or_equal_to => 0}

  validates :barcode, :uniqueness => true

  validates_associated :stock_levels

  def total_stock
      stock_levels.sum(&:quantity)
  end

  def total_sold
    sale_items.sum(&:quantity)
  end

  def total_on_order
    supplier_stock_orders.where(:status => ['Created', 'Processed']).sum(&:quantity)
  end

  def revenue
    sale_items.sum(&:quantity).to_f * price.to_f
  end

  def total_cost
    sale_items.sum(&:quantity).to_f * cost.to_f
  end

end

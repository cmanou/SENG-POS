class ReportsController < ApplicationController
  def index
  end

  def sale
    @sales = Sale.all

    respond_to do |format|
      format.html # sale.html.erb
    end
  end

  def stock
  end

  def financial
  end

  def staff
  end

  def supplier
    @supplier_stock_orders = SupplierStockOrder.all

    respond_to do |format|
      format.html # suppliers.html.erb
    end
  end

  def customer
  end
end

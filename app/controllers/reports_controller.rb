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
    @products = Product.all

    respond_to do |format|
      format.html # suppliers.html.erb
    end
  end

  def financial
  end

  def staff
    @users = User.where(:role => [ 'Owner', 'Manager', 'Stock Control', 'Cashier'])

    respond_to do |format|
      format.html # suppliers.html.erb
    end
  end

  def supplier
    @supplier_stock_orders = SupplierStockOrder.all

    respond_to do |format|
      format.html # suppliers.html.erb
    end
  end

  def customer
    @users = User.all
    respond_to do |format|
      format.html # suppliers.html.erb
    end
  end
end

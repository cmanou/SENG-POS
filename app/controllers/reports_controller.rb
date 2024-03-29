class ReportsController < ApplicationController
  def index
  end

  def sale
    @sales = Sale.where(:status =>"Finished")

    @users = User.all

    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "area"
      f.options[:title][:text] = "Sales By Customer"
      f.options[:yAxis][:title][:text] = "Total of Sale"
      f.options[:xAxis] = { :title=>{:text=>"Date"}, :type => 'datetime',:dateTimeLabelFormats=>{:month=>'%e. %b',:year=>'%b'}}



      @users.each do |u| 
        f.series(:name=>u.name,
          :data=>u.sales_customer.where(:status =>"Finished").pluck(:updated_at).zip(u.sales_customer.where(:status =>"Finished").map(&:total).map(&:to_f))
        #User.find(4).sales_customer.pluck(:updated_at).zip(User.find(4).sales_customer.map(&:total).map(&:to_f))
          )
      end
    end


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
    @products = Product.all
    @revenue = @products.sum(&:revenue)
    @cost = @products.sum(&:total_cost)
    @profit = @revenue - @cost 

    @gst = @revenue * -0.1
    @tax =  @gst*0.3

    @income = @profit + @gst + @tax


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

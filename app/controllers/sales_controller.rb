class SalesController < ApplicationController
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])
    @sale_items = @sale.sale_items

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @current_sales = Sale.find_all_by_checkout_user_id_and_status(current_user.id, ['Adding to Cart', 'Checking Out'])

    if @current_sales.empty?
      @sale = Sale.new(:checkout_user  => current_user, :status => 'Adding to Cart')
      @sale.save

      respond_to do |format|
        format.html { redirect_to edit_sale_path(@sale) }
        format.json { render json: @sale}
      end
    else
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @current_sales }
      end
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])

    case @sale.status
    when 'Adding to Cart'
      @sale_item = SaleItem.new({:sale => @sale})
      render @sale.status.parameterize.underscore
    when 'Checking Out'
      @transaction = Transaction.new(:sale => @sale)
      render 'checking_out'
    when 'Finished'
      redirect_to sale_path(@sale), :error => "Can't edit a finished sale"
    end
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(:checkout_user  => current_user, :status => 'Adding to Cart')
    @sale.save

    respond_to do |format|
      format.html { redirect_to edit_sale_path(@sale) }
      format.json { render json: @sale}
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    params[:sale][:customer] = User.find_by_id(params[:sale][:customer])
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to edit_sale_path(@sale), notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkout
    @sale = Sale.find(params[:id])

    if @sale.status != 'Adding to Cart'
      redirect_to sales_path, alert: 'You can only proceed to payment from adding to cart'
    end

    @sale.status = 'Checking Out'
    @sale.save!

    respond_to do |format|
      format.html { redirect_to edit_sale_path(@sale) }
      format.json { head :no_content }
    end
  end

  def complete
    @sale = Sale.find(params[:id])

    if @sale.status != 'Checking Out'
      redirect_to sales_path, alert: 'You can only finish a sale during checkout.'
      return
    end

    if @sale.total > @sale.amount_paid + @sale.discount
      redirect_to edit_sale_path(@sale), alert: 'You must finish payment before completing a sale.'
      return
    end

    @sale.status = 'Finished'
    @sale.save!

    floor = StockLocation.where :name => 'Floor' #maybe this should be configurable?
    @sale.sale_items.each do |sale_item|
      level = StockLevel.find_by_product_id_and_stock_location_id(sale_item.product, floor)
      level.quantity -= sale_item.quantity
      level.save!
    end

    respond_to do |format|
      format.html { redirect_to @sale, notice: 'Sale complete.' }
      format.json { head :no_content }
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end
end

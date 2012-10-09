class RefundsController < ApplicationController
  # GET /refunds
  # GET /refunds.json
  def index
    @refunds = Refund.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @refunds }
    end
  end

  # GET /refunds/1
  # GET /refunds/1.json
  def show
    @refund = Refund.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @refund }
    end
  end

  # GET /refunds/new
  # GET /refunds/new.json
  def new
    @refund = Refund.new
    @refund.sale_item = SaleItem.find(params[:sale_item])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @refund }
    end
  end

  # GET /refunds/1/edit
  def edit
    @refund = Refund.find(params[:id])
  end

  # POST /refunds
  # POST /refunds.json
  def create
    @refund = Refund.new(params[:refund])
    @refund.sale_item = SaleItem.find(params[:sale_item_id])
    @refund.checkout_user = current_user
    @refund.total = (@refund.sale_item.sub_total / @refund.sale_item.quantity) * @refund.quantity
    # Verify quantity is not greater than sale_item quantity

    respond_to do |format|
      if @refund.save
        # Update stock levels
        @stock_location = StockLocation.where("previous_location_id is NULL")
        @stock_level = @refund.sale_item.product.stock_levels.find_by_id(@stock_location)
        @stock_level.quantity += @refund.quantity
        @stock_level.save
        
        format.html { redirect_to @refund, notice: 'Refund was successfully created.' }
        format.json { render json: @refund, status: :created, location: @refund }
      else
        format.html { render action: "new" }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /refunds/1
  # PUT /refunds/1.json
  def update
    @refund = Refund.find(params[:id])
    @refund.total = (@refund.sale_item.sub_total / @refund.sale_item.quantity) * params[:refund][:quantity].to_i
    # Verify quantity is not greater than sale_item quantity    
    
    # Get previous quantity
    @previous_quantity = @refund.quantity
    
    respond_to do |format|
      if @refund.update_attributes(params[:refund])
        # Update stock levels
        @stock_location = StockLocation.where("previous_location_id is NULL")
        @stock_level = @refund.sale_item.product.stock_levels.find_by_id(@stock_location)
        @stock_level.quantity += (@refund.quantity - @previous_quantity)
        @stock_level.save
        
        format.html { redirect_to @refund, notice: 'Refund was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refunds/1
  # DELETE /refunds/1.json
  def destroy
    @refund = Refund.find(params[:id])
    @refund.destroy

    respond_to do |format|
      format.html { redirect_to refunds_url }
      format.json { head :no_content }
    end
  end

  def search
    matches = Sale.where(:id => params[:sale_id])
    if matches.any?
      redirect_to matches.first
    else
      redirect_to refunds_path, alert: 'Invalid Sale ID'
    end
  end
end

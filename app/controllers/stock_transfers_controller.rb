class StockTransfersController < ApplicationController
  # GET /stock_transfers
  # GET /stock_transfers.json
  def index
    @stock_transfers = StockTransfer.order("complete DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stock_transfers }
    end
  end

  # GET /stock_transfers/1
  # GET /stock_transfers/1.json
  def show
    @stock_transfer = StockTransfer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock_transfer }
    end
  end

  # GET /stock_transfers/new
  # GET /stock_transfers/new.json
  def new
    @stock_transfer = StockTransfer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock_transfer }
    end
  end

  # GET /stock_transfers/1/edit
  def edit
    @stock_transfer = StockTransfer.find(params[:id])
  end

  # POST /stock_transfers
  # POST /stock_transfers.json
  def create
    

    @product = Product.find(Integer(params[:stock_transfer][:product]))
    @stock_location = StockLocation.find(Integer(params[:stock_transfer][:stock_location]))

    params[:stock_transfer][:product] = @product
    params[:stock_transfer][:stock_location] = @stock_location

    @stock_transfer = StockTransfer.new(params[:stock_transfer])

    respond_to do |format|
      if @stock_transfer.save
        format.html { redirect_to stock_transfers_path, notice: 'Stock transfer was successfully created.' }
        format.json { render json: @stock_transfer, status: :created, location: @stock_transfer }
      else
        format.html { render action: "new" }
        format.json { render json: @stock_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stock_transfers/1
  # PUT /stock_transfers/1.json
  def update

    @stock_transfer = StockTransfer.find(params[:id])

    respond_to do |format|
      @product = Product.find(Integer(params[:stock_transfer][:product]))
      @stock_location = StockLocation.find(Integer(params[:stock_transfer][:stock_location]))

      params[:stock_transfer][:product] = @product
      params[:stock_transfer][:stock_location] = @stock_location
      if @stock_transfer.update_attributes(params[:stock_transfer])
        format.html { redirect_to stock_transfers_path, notice: 'Stock transfer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_transfers/1
  # DELETE /stock_transfers/1.json
  def destroy
    @stock_transfer = StockTransfer.find(params[:id])
    @stock_transfer.destroy

    respond_to do |format|
      format.html { redirect_to stock_transfers_url }
      format.json { head :no_content }
    end
  end

  
  # Event-b: MoveStockToFloor & MoveStockToBackroom
  def complete
    @stock_transfer = StockTransfer.find(params[:id])
    @product = @stock_transfer.product
    # Event-b: product ∈ activeProducts
    @locationto = @stock_transfer.stock_location
    @locationfrom = @locationto.previous_location


    #Mark as complete
    @stock_transfer.update_attribute(:complete,true)
    @stock_transfer.save

    #Event-b : act1: productlevels(product) ≔ productlevels(product) <+ {Floor ↦ (productlevels(product)(Floor) + amount),Backroom ↦ (productlevels(product)(Backroom) − amount)}
    @stock_level_to = StockLevel.find_by_product_id_and_stock_location_id(@product,@locationto)
    @stock_level_to.update_attribute(:quantity, (@stock_level_to.quantity + @stock_transfer.quantity))
    @stock_level_to.save

    @stock_level_from = StockLevel.find_by_product_id_and_stock_location_id(@product,@locationfrom)
    @stock_level_from.update_attribute(:quantity, (@stock_level_from.quantity - @stock_transfer.quantity))
    @stock_level_from.save




    respond_to do |format|
      format.html { redirect_to stock_transfers_url }
      format.json { head :no_content }
    end
  end


end

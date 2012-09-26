class SupplierStockOrdersController < ApplicationController
  # GET /supplier_stock_orders
  # GET /supplier_stock_orders.json
  def index
    @supplier_stock_orders = SupplierStockOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supplier_stock_orders }
    end
  end

  # GET /supplier_stock_orders/1
  # GET /supplier_stock_orders/1.json
  def show
    @supplier_stock_order = SupplierStockOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplier_stock_order }
    end
  end

  # GET /supplier_stock_orders/new
  # GET /supplier_stock_orders/new.json
  def new
    @supplier_stock_order = SupplierStockOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplier_stock_order }
    end
  end

  # GET /supplier_stock_orders/1/edit
  def edit
    @supplier_stock_order = SupplierStockOrder.find(params[:id])
  end

  # POST /supplier_stock_orders
  # POST /supplier_stock_orders.json
  def create
    @supplier_stock_order = SupplierStockOrder.new(params[:supplier_stock_order])

    respond_to do |format|
      if @supplier_stock_order.save
        format.html { redirect_to @supplier_stock_order, notice: 'Supplier stock order was successfully created.' }
        format.json { render json: @supplier_stock_order, status: :created, location: @supplier_stock_order }
      else
        format.html { render action: "new" }
        format.json { render json: @supplier_stock_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supplier_stock_orders/1
  # PUT /supplier_stock_orders/1.json
  def update
    @supplier_stock_order = SupplierStockOrder.find(params[:id])

    respond_to do |format|
      if @supplier_stock_order.update_attributes(params[:supplier_stock_order])
        format.html { redirect_to @supplier_stock_order, notice: 'Supplier stock order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplier_stock_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_stock_orders/1
  # DELETE /supplier_stock_orders/1.json
  def destroy
    @supplier_stock_order = SupplierStockOrder.find(params[:id])
    @supplier_stock_order.destroy

    respond_to do |format|
      format.html { redirect_to supplier_stock_orders_url }
      format.json { head :no_content }
    end
  end
end

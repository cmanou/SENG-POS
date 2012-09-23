class SaleItemsController < ApplicationController
  # GET /sale_items
  # GET /sale_items.json
  def index
    @sale = Sale.find(params[:sale_id])
    @sale_items = @sale.sale_items

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sale_items }
    end
  end

  # GET /sale_items/1
  # GET /sale_items/1.json
  def show
    @sale_item = SaleItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale_item }
    end
  end

  # GET /sale_items/new
  # GET /sale_items/new.json
  def new
    @sale = Sale.find(params[:sale_id])
    @sale_item = @sale.sale_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale_item }
    end
  end

  # GET /sale_items/1/edit
  def edit
    @sale_item = SaleItem.find(params[:id])
    @sale = @sale_item.sale
  end

  # POST /sale_items
  # POST /sale_items.json
  def create
    @product = Product.find(params[:sale_item][:product])
    params[:sale_item][:product] = @product;
    @sale_item = SaleItem.new(params[:sale_item])
    @sale_item.sale = Sale.find(params[:sale_id])

    respond_to do |format|
      if @sale_item.save
        format.html { redirect_to sale_sale_items_path(@sale_item.sale), notice: 'Sale item was successfully created.' }
        format.json { render json: @sale_item.sale, status: :created, location: @sale_item }
      else
        format.html { render action: "new" }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sale_items/1
  # PUT /sale_items/1.json
  def update
    @product = Product.find(params[:sale_item][:product])
    params[:sale_item][:product] = @product;
    @sale_item = SaleItem.find(params[:id])

    respond_to do |format|
      if @sale_item.update_attributes(params[:sale_item])
        format.html { redirect_to sale_sale_items_path(@sale_item.sale), notice: 'Sale item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_items/1
  # DELETE /sale_items/1.json
  def destroy
    @sale_item = SaleItem.find(params[:id])
    @sale = @sale_item.sale
    @sale_item.destroy

    respond_to do |format|
      format.html { redirect_to sale_sale_items_path(@sale) }
      format.json { head :no_content }
    end
  end
end

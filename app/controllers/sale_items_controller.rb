class SaleItemsController < ApplicationController
  # GET /sale_items
  # GET /sale_items.json
  def index
    @sale_items = SaleItem.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sale_items.to_json }
    end
  end

  # GET /sale_items/1
  # GET /sale_items/1.json
  def show
    @sale_item = SaleItem.find(params[:id])

    respond_to do |format|
      format.json { render :json => @sale_item.to_json }
    end
  end

  # GET /sale_items/new
  # GET /sale_items/new.json
  def new
    @sale = params[:sale]
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
    @product = Product.find_by_barcode(params[:sale_item][:product])
    if @product.nil?
      render :json => {:errors => "This product doesn't exist"}, :status=>422
    else

      params[:sale_item][:product] = @product;

      @sale = Sale.find(params[:sale_item][:sale])
      params[:sale_item][:sale] = @sale;

      @sale_item = SaleItem.find_by_sale_id_and_product_id(@sale.id, @product.id)
      if @sale_item.nil?
        @sale_item = SaleItem.new(params[:sale_item])
      else
        @sale_item.quantity += params[:sale_item][:quantity].to_i
      end

      @sale_item.sub_total = @sale_item.quantity * @sale_item.product.price

      respond_to do |format|
        if @sale_item.save
          format.json { render :show }
        else
          format.json { render json: @sale_item.errors, status: :unprocessable_entity }
        end
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

class ProductsController < ApplicationController
  skip_before_filter  :authenticate_user!, :only => [:index, :show]
  # GET /products
  # GET /products.json
  def index
    @products = Product.order("name")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    StockLocation.all.each do |s|
      @product.stock_levels.build(:stock_location => s)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])

    StockLocation.all.each do |s|
      if !StockLevel.exists?(:product_id => params[:id].to_i, :stock_location_id =>s.id)
        @product.stock_levels.build(:stock_location => s)
      end
    end

  end

  # POST /products
  # POST /products.json
  def create
    #raise params.inspect
    @supplier = nil
    if(params[:product][:supplier] != "") 
    @supplier = Supplier.find_by_id(Integer(params[:product][:supplier]))
    end

    params[:product][:supplier] = @supplier

    @product = Product.new(params[:product])
    
    params[:stock_level].each do |sl_id, sl|
      @product.stock_levels.build(:stock_location => StockLocation.find(sl_id.to_i), :quantity =>sl[:quantity], :threshold => sl[:threshold])
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    params[:stock_level].each do |sl_id, sl|
      begin
      @stock_id = StockLevel.find(:first, :conditions => {:product_id => params[:id].to_i, :stock_location_id =>sl_id.to_i})
        @product.stock_levels.update(@stock_id, :quantity =>sl[:quantity], :threshold => sl[:threshold])
      rescue ActiveRecord::RecordNotFound
        @product.stock_levels.build(:stock_location => StockLocation.find(sl_id.to_i), :quantity =>sl[:quantity], :threshold => sl[:threshold])
      end
    end

    respond_to do |format|
      @supplier = Supplier.find(Integer(params[:product][:supplier]))
      params[:product][:supplier] = @supplier
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  # GET /products/1/activate
  def activate
    @product = Product.find(params[:id])

    @product.update_attribute(:active,true)
    @product.save

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  # GET /products/1/deactivate
  def deactivate
    @product = Product.find(params[:id])

    @product.update_attribute(:active,false)
    @product.save

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

end

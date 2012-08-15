class StockLevelsController < ApplicationController
  skip_before_filter  :authenticate_user!, :only => [:index, :show]
  # GET /stock_levels
  # GET /stock_levels.json
  def index
    @stock_levels = StockLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stock_levels }
    end
  end

  # GET /stock_levels/1
  # GET /stock_levels/1.json
  def show
    @stock_level = StockLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock_level }
    end
  end

  # GET /stock_levels/new
  # GET /stock_levels/new.json
  def new
    @stock_level = StockLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock_level }
    end
  end

  # GET /stock_levels/1/edit
  def edit
    @stock_level = StockLevel.find(params[:id])
  end

  # POST /stock_levels
  # POST /stock_levels.json
  def create
    @product = Product.find(Integer(params[:stock_level][:product]))
    @stock_location = StockLocation.find(Integer(params[:stock_level][:stock_location]))

    params[:stock_level][:product] = @product
    params[:stock_level][:stock_location] = @stock_location

    @stock_level = StockLevel.new(params[:stock_level])

    respond_to do |format|
      if @stock_level.save
        format.html { redirect_to @stock_level, notice: 'Stock level was successfully created.' }
        format.json { render json: @stock_level, status: :created, location: @stock_level }
      else
        format.html { render action: "new" }
        format.json { render json: @stock_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stock_levels/1
  # PUT /stock_levels/1.json
  def update
    @stock_level = StockLevel.find(params[:id])

    respond_to do |format|
      if @stock_level.update_attributes(params[:stock_level])
        format.html { redirect_to @stock_level, notice: 'Stock level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_levels/1
  # DELETE /stock_levels/1.json
  def destroy
    @stock_level = StockLevel.find(params[:id])
    @stock_level.destroy

    respond_to do |format|
      format.html { redirect_to stock_levels_url }
      format.json { head :no_content }
    end
  end
end

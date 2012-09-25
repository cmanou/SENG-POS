class StockLocationsController < ApplicationController
  skip_before_filter  :authenticate_user!, :only => [:index, :show]

  # GET /stock_locations
  # GET /stock_locations.json
  def index
    @stock_locations = StockLocation.order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stock_locations }
    end
  end

  # GET /stock_locations/1
  # GET /stock_locations/1.json
  def show
    @stock_location = StockLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock_location }
    end
  end

  # GET /stock_locations/new
  # GET /stock_locations/new.json
  def new
    @stock_location = StockLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock_location }
    end
  end

  # GET /stock_locations/1/edit
  def edit
    @stock_location = StockLocation.find(params[:id])
  end

  # POST /stock_locations
  # POST /stock_locations.json
  def create
    @stock_location = StockLocation.new(params[:stock_location])

    respond_to do |format|
      if @stock_location.save
        format.html { redirect_to @stock_location, notice: 'Stock location was successfully created.' }
        format.json { render json: @stock_location, status: :created, location: @stock_location }
      else
        format.html { render action: "new" }
        format.json { render json: @stock_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stock_locations/1
  # PUT /stock_locations/1.json
  def update
    @stock_location = StockLocation.find(params[:id])

    respond_to do |format|
      if @stock_location.update_attributes(params[:stock_location])
        format.html { redirect_to @stock_location, notice: 'Stock location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_locations/1
  # DELETE /stock_locations/1.json
  def destroy
    @stock_location = StockLocation.find(params[:id])
    @stock_location.destroy

    respond_to do |format|
      format.html { redirect_to stock_locations_url }
      format.json { head :no_content }
    end
  end
end

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
    @sale = Sale.new(:checkout_user  => current_user, :status => 'Adding to Cart')
    @sale.save

    respond_to do |format|
      format.html { redirect_to edit_sale_path(@sale) }
      format.json { render json: @sale}
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])

    case @sale.status
    when 'Adding to Cart'
      @sale_item = SaleItem.new({:sale => @sale})
      render 'edit' #rename this
    when 'Checking Out'
      @sale_item = SaleItem.new({:sale => @sale})
      render 'edit'
    when 'Finished'
      redirect_to edit_sale_path(@sale), :error => "Can't edit a finished sale"
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    next_status = { 'Adding to Cart' => 'Checking Out', 'Checking Out' => 'Finished' }
    if params[:commit]
      @sale.status = next_status[@sale.status]

      respond_to do |format|
        if @sale.save
          format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @sale.errors, status: :unprocessable_entity }
        end
      end
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

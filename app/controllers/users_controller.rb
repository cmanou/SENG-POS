class UsersController < ApplicationController
  def members_index
    #since default isn't a real customer
    @users = User.where("email != 'default@pos.com'")

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def staff_index
    @users = User.where(:role  => ['Owner', 'Manager', 'Stock Control', 'Cashier'])

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def purchases
    @past_sales = Sale.find_all_by_checkout_user_id_and_status(current_user.id, ['Finished'])

    respond_to do |format|
      format.html
      format.json { render json: @past_sales }
    end
  end
  
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])    
        format.html { 
          flash[:notice] = 'User was successfully updated.'
          render :edit
        }
        format.json { render json: @user }
      else
        format.html { render action: "edit" }
      end
    end
  end
end

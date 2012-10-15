class UsersController < ApplicationController
  def members_index
    @users = User.all
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
      format.html { 
        flash[:notice] = 'User was successfully updated.'
        render :edit
      }
      format.json { render json: @user }
    end
  end
end

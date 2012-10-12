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
  
  def members_edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { render 'devise/registrations/edit' }
      format.json { render json: @user }
    end
  end

end

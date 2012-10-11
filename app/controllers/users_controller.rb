class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def staff_index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
  
  def account
    @user = current_user

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

end

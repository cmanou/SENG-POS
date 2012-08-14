class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  def can_checkout
    return true
  end
  def can_manage_stock
    return true
  end
  def can_report
    return true
  end
end

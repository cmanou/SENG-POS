class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable

  #userPrivileges(user) ∈ {Stock_Control,Manager,Owner}
  validates :role,
    :inclusion  => { :in => [ 'Owner', 'Manager', 'Stock Control', 'Cashier', 'Default'],
    :message    => "%{value} is not a valid status" }
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  


  def can_checkout
    return true
  end
  def can_manage_stock
    role == "Owner" or role == "Manager" or role == "Stock Control"
  end
  def can_report
    role == "Owner" or role == "Manager"
  end
end

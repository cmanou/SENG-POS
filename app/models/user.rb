class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable

  has_many :sales_checkout, :class_name => 'Sale', :foreign_key => "checkout_user_id"
  has_many :sales_customer, :class_name => 'Sale', :foreign_key => "customer_id"
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role, :name, :postcode, :discount, :membership, :active, :email, :password, :password_confirmation, :remember_me

  #userPrivileges(user) ∈ {Stock_Control,Manager,Owner, Cashier}
  validates :role,
    :inclusion  => { :in => [ 'Owner', 'Manager', 'Stock Control', 'Cashier', 'Default'],
    :message    => "%{value} is not a valid status" }
  


  def can_checkout
    role == "Owner" or role == "Manager" or role == "Stock Control" or role =="Cashier"
  end
  def can_manage_stock
    role == "Owner" or role == "Manager" or role == "Stock Control"
  end
  def can_report
    role == "Owner" or role == "Manager"
  end

  def num_sales
    sales_checkout.count
  end

  def num_purchases
    sales_customer.count
  end

  def total_sales
    sales_checkout.sum(&:total)
  end

  def total_purchases
    sales_customer.sum(&:total)
  end
end

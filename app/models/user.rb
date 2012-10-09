class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable

  has_many :sales_checkout, :class_name => 'Sale', :foreign_key => "checkout_user_id"
  has_many :sales_customer, :class_name => 'Sale', :foreign_key => "customer_id"
  
  attr_accessible :role, :name, :postcode, :discount, :membership, :active, :email, :password, :password_confirmation, :remember_me

  #Event-B: {Stock_ctx_R0} axm2: partition(USER_PRIVILEGE,{Cashier},{Stock_Control},{Manager},{Owner})
  #Comment: Default was added as a result of merging the users and members
  validates :role,
    :inclusion  => { :in => [ 'Owner', 'Manager', 'Stock Control', 'Cashier', 'Default'],
    :message    => "%{value} is not a valid status" }
  

  #Event-B: {StockControl_R4} grd: userPrivileges(user) ∈ {Stock_Control, Manager, Owner, Cashier}
  #Comment: Used as guards throughout the model
  def can_checkout
    role == "Owner" or role == "Manager" or role == "Stock Control" or role =="Cashier"
  end

  #Event-B: {StockControl_R4} grd: userPrivileges(user) ∈ {Stock_Control, Manager, Owner}
  #Comment: Used as guards throughout the model  
  def can_manage_stock
    role == "Owner" or role == "Manager" or role == "Stock Control"
  end

  #Event-B: {StockControl_R4} grd: userPrivileges(user) ∈ {Manager, Owner}
  #Comment: Used as guards throughout the model  
  def can_report
    role == "Owner" or role == "Manager"
  end


  #Various Methods
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

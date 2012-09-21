class Supplier < ActiveRecord::Base
  has_many :products
  attr_accessible :contact_number, :contact_person, :name
end

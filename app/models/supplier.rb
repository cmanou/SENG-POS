class Supplier < ActiveRecord::Base
  has_many :products
  attr_accessible :contact_number, :contact_person, :name

  validates :name, :contact_number, :contact_person, :presence => true
  validates :name, :uniqueness => true

end

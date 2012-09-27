class Transaction < ActiveRecord::Base
  belongs_to :sale

  attr_accessible :amount, :approved, :method, :sale

  validates :amount, :presence => true,
      :exclusion => { :in => [0], :message => "Must be non-zero amount." }

  validates :method, :presence => true, :inclusion => { :in => ['Cash', 'Other']}

  validates_associated :sale
end

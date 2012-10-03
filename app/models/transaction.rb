class Transaction < ActiveRecord::Base
  belongs_to :sale

  attr_accessible :amount, :approved, :method, :sale
  validates_presence_of :amount, :approved, :method, :sale

  validates :amount, :exclusion =>
  	{:in => [0], :message => "Must be non-zero amount." }

  validates :method,  :inclusion => { :in => ['Cash', 'Other']}

  validates :amount, :if => Proc.new {method == 'Cash'},
  	:inclusion => {:in => [0.05, 0.10, 0.20, 0.50, 1.00, 2.00, 5.00, 10.00, 20.00, 50.00, 100.00]}

#   validates_acceptance_of :approved
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ['Owner', 'Manager', 'Stock Control', 'Checkout', 'Customer'],
User.create([{
  :name => 'Mr Owner',
  :email => 'owner@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Owner',
  :active => true
},{  
  :name => 'Mr Manager',
  :email => 'manager@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Manager',
  :active => true
},{
  :name => 'Mr Stock Guy',
  :email => 'stock@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Stock Control',
  :active => true
},{
  :name => 'Ms Cashier',
  :email => 'cashier@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Cashier',
  :active => true
},{
  :name => 'Unknown Customer',
  :email => 'default@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Default',
  :active => true
},{
  :name => 'Chris',
  :email => 'chris.manouvrier@gmail.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Default',
  :active => true
}])

StockLocation.create([{ :name => 'Warehouse' }])
StockLocation.create([{:name => 'Backroom', :previous_location => StockLocation.last}])
StockLocation.create([{:name => 'Floor', :previous_location => StockLocation.last}])


Supplier.create([{
    :name => 'Organic Grocers',
    :contact_person => 'Chin Wang',
    :contact_number => '61-2-8339-9188'
},{
    :name => 'Black & Gold',
    :contact_person => 'Mr BG',
    :contact_number => '61-2-9999-8888'
},{
    :name => "Chris' Fruit",
    :contact_person => 'Chris',
    :contact_number => '61-2-9385-5356'
},{
    :name => "Vincents Meat Supply",
    :contact_person => 'Vincent Wong',
    :contact_number => '61-2-9696-9696'
}])

Product.create([{
    :name => 'Bread',
    :cost => 0.65,
    :size => '600g',
    :price => 3.98,
    :brand => 'Coles',
    :active => true,
    :barcode => 12093812,
    :supplier => Supplier.first,
    :description => 'Coles bread.'
},{
    :name => 'Butter',
    :cost => 0.70,
    :size => '150g',
    :price => 3.50,
    :brand => 'Dante Dudley',
    :active => false,
    :barcode => 'FQN69YTW1DP',
    :supplier => Supplier.first,
    :description => 'Full fat butter'
},{
    :name => 'Cheese',
    :cost => 1.40,
    :size => '500g',
    :price => 5.59,
    :brand => 'David Chapman',
    :active => true,
    :barcode => 'AGI69MAF7HK',
    :supplier => Supplier.first,
    :description => 'Blue Cheese'
},{
    :name => 'Orange Juice',
    :cost => 1.77,
    :size => '800g',
    :price => 6.50,
    :brand => 'Warren Whitfield',
    :active => true,
    :barcode => 'KYW60LFJ5SJ',
    :supplier => Supplier.last,
    :description => 'premium orange juice'
},{
    :name => 'Apple Juice',
    :cost =>1.80,
    :size => '800g',
    :price => 6.80,
    :brand => 'Colorado Glover',
    :active => false,
    :barcode => 'OEM89HAX2UH',
    :supplier => Supplier.first,
    :description => 'premium orange juice'
},{
    :name => 'Ham',
    :cost => 7.80,
    :size => '1500g',
    :price => 16.40,
    :brand => 'Macon Stevenson',
    :active => true,
    :barcode => 'MXA23BGQ4QF',
    :supplier => Supplier.last,
    :description => 'double smoked leg ham'
},{
    :name => 'Beef',
    :cost => 3.90,
    :size => '700g',
    :price => 12.80,
    :brand => 'Louis Shepherd',
    :active => true,
    :barcode => 'VMR15VTF7TR',
    :supplier => Supplier.last,
    :description => 'porterhouse 5 star'
},{
    :name => 'Salad',
    :cost =>  2.40,
    :size => '400g',
    :price => 7.00,
    :brand => 'Damon Salazar',
    :active => true,
    :barcode => 'VXW32YTY7LT',
    :supplier => Supplier.first,
    :description => 'ceaser salad'
},{
    :name => 'Red Frogs',
    :cost => 0.92,
    :size => '250g',
    :price => 2.99,
    :brand => 'Leonard Hall',
    :active => true,
    :barcode => 'FDP29UWG6RB',
    :supplier => Supplier.last,
    :description => 'Sweets'
},{
    :name => 'Coca Cola',
    :cost => 0.48,
    :size => '375 mL',
    :price => 1.70,
    :brand => 'Coca Cola',
    :active => true,
    :barcode => '9300675001410',
    :supplier => Supplier.last,
    :description => 'Coca cola medium bottle'
},{
    :name => 'Mentos',
    :cost => 0.34,
    :size => '370g',
    :price => 1.74,
    :brand => 'Mentos',
    :active => true,
    :barcode => 'LTF22KYL9KY',
    :supplier => Supplier.last,
    :description => 'Mint Gum'
},{
    :name => 'Fanta',
    :cost => 0.48,
    :size => '375 mL',
    :price => 1.70,
    :brand => 'Coca Cola',
    :active => true,
    :barcode => '9300675003414',
    :supplier => Supplier.first,
    :description => 'Fanta medium bottle'
},{
    :name => 'Pasta',
    :cost => 2.28,
    :size => '750g',
    :price => 4.79,
    :brand => 'Dane Dillard',
    :active => true,
    :barcode => 'XAX17LRW8PM',
    :supplier => Supplier.last,
    :description => 'Fettucini'
},{
    :name => 'Rice',
    :cost => 10.36,
    :size => '1000g',
    :price => 20.41,
    :brand => 'Micah Campbell',
    :active => false,
    :barcode => 'TAZ03VTO0LM',
    :supplier => Supplier.first,
    :description => 'Asian rice la'
},{
    :name => 'Beef Sausages',
    :cost => 5.78,
    :size => '306g',
    :price => 9.89,
    :brand => 'Logan Weaver',
    :active => false,
    :barcode => 'MEU65HBF4DZ',
    :supplier => Supplier.first,
    :description => 'Smoked beef susuage'
},{
    :name => 'Vanilla Icecream',
    :cost => 1.95,
    :size => '700g',
    :price => 5.32,
    :brand => 'Addison Cohen',
    :active => true,
    :barcode => 'COL93UPY7UL',
    :supplier => Supplier.last,
    :description => 'Cremey vanilla Icecream'
},{
    :name => 'Smiths Chips',
    :cost => 0.85,
    :size => '96g',
    :price => 3.50,
    :brand => 'Damon Dejesus',
    :active => true,
    :barcode => 'SJR42KTI5OK',
    :supplier => Supplier.first,
    :description => 'Chips Small pack.'
},{
    :name => 'Pringles',
    :cost => 1.81,
    :size => '400g',
    :price => 4.41,
    :brand => 'Kadeem Newton',
    :active => true,
    :barcode => 'MGX90AQI2HA',
    :supplier => Supplier.last,
    :description => 'Pringles normal tube'
},{
    :name => 'Nutella',
    :cost => 1.36,
    :size => '200g',
    :price => 4.20,
    :brand => 'Wallace Rivers',
    :active => true,
    :barcode => 'CUX55UYD4TP',
    :supplier => Supplier.last,
    :description => 'Nutella small tub'
},{
    :name => 'Jam',
    :cost => 0.68,
    :size => '162g',
    :price => 3.10,
    :brand => 'Trevor Jacobs',
    :active => false,
    :barcode => 'NKP37VOS6EV',
    :supplier => Supplier.first,
    :description => 'Strawberry Jam'
},{
    :name => 'Carrots',
    :cost => 0.83,
    :size => '248g',
    :price => 4.12,
    :brand => 'Dante Barrera',
    :active => true,
    :barcode => 'YSH63LUH9YU',
    :supplier => Supplier.first,
    :description => 'Purple carrots'
}])

StockLocation.all.each do |location|
    Product.all.each do |product|
        StockLevel.create({
            :product => product,
            :stock_location => location,
            :quantity => 20,
            :threshold => 20
        })
    end
end

Sale.create!([{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).first,
    :checkout_user => User.where(:role => ['Manager']).first,
    :updated_at => Time.now + 501000
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).last,
    :checkout_user => User.where(:role => [ 'Owner']).first,
    :updated_at => Time.now + 301000
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).last,
    :checkout_user => User.where(:role => [ 'Owner']).first,
    :updated_at => Time.now + 401000
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default','Cashier']).first,
    :checkout_user => User.where(:role => ['Stock Control']).first,
    :updated_at => Time.now + 501000
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).first,
    :checkout_user => User.where(:role => ['Manager']).first,
    :updated_at => Time.now + 201000
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).last,
    :checkout_user => User.where(:role => [ 'Owner']).first,
    :updated_at => Time.now + 901000
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).last,
    :checkout_user => User.where(:role => [ 'Owner']).first
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default','Cashier']).first,
    :checkout_user => User.where(:role => ['Stock Control']).first
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).first,
    :checkout_user => User.where(:role => ['Manager']).first
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).last,
    :checkout_user => User.where(:role => [ 'Owner']).first
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default']).last,
    :checkout_user => User.where(:role => [ 'Owner']).first
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.where(:role => [ 'Default','Cashier']).first,
    :checkout_user => User.where(:role => ['Stock Control']).first
},{
    :status => 'Adding to Cart',
    :discount => 0,
    :customer => User.where(:role => [ 'Default','Cashier']).first,
    :checkout_user => User.where(:role => ['Cashier']).first
},{
    :status => 'Adding to Cart',
    :discount => 0,
    :customer => User.where(:role => [ 'Default','Cashier']).first,
    :checkout_user => User.where(:role => ['Stock Control']).first
},{
    :status => 'Checking Out',
    :discount => 0,
    :customer => User.where(:role => [ 'Default','Cashier']).first,
    :checkout_user => User.where(:role => ['Cashier']).first
},{
    :status => 'Checking Out',
    :discount => 0,
    :customer => User.where(:role => [ 'Default','Cashier']).last,
    :checkout_user => User.where(:role => ['Cashier']).last
}])

Product.all.each do |product|
    Sale.all.each do |sale|
        quantity = rand(2) + 1
        SaleItem.create({
            :sale => sale,
            :product => product,
            :quantity => quantity,
            :sub_total => quantity * product.price
        })
    end
end

StockTransfer.create([{
    :product => Product.offset(rand(Product.count)).first,
    :stock_location => StockLocation.where("previous_location_id is NOT NULL").first,
    :quantity => rand(20),
    :complete => true,
},{
    :product => Product.offset(rand(Product.count)).first,
    :stock_location => StockLocation.where("previous_location_id is NOT NULL").last,
    :quantity => rand(20),
    :complete => true,
},{
    :product => Product.offset(rand(Product.count)).first,
    :stock_location => StockLocation.where("previous_location_id is NOT NULL").last,
    :quantity => rand(20),
    :complete => false,
},{
    :product => Product.offset(rand(Product.count)).first,
    :stock_location => StockLocation.where("previous_location_id is NOT NULL").last,
    :quantity => rand(20),
    :complete => false,
}])

SupplierStockOrder.create([{
    :product => Product.offset(rand(Product.count)).first,
    :quantity => rand(20),
    :status => 'Created',
},{
    :product => Product.offset(rand(Product.count)).first,
    :quantity => rand(20),
    :status => 'Processed',
},{
    :product => Product.offset(rand(Product.count)).first,
    :quantity => rand(20),
    :status => 'Completed',
},{
    :product => Product.offset(rand(Product.count)).first,
    :quantity => rand(20),
    :status => 'Processed',
},{
    :product => Product.offset(rand(Product.count)).first,
    :quantity => rand(20),
    :status => 'Completed',
}])




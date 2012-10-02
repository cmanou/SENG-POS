# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ['Owner', 'Manager', 'Stock Control', 'Checkout', 'Customer'],
User.create([{
  :email => 'owner@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Owner'
},{  
  :email => 'manager@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Manager'
},{
  :email => 'stock@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Stock Control'
},{
  :email => 'cashier@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Cashier'
},{
  :email => 'default@pos.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Default'
},{
  :email => 'chris.manouvrier@gmail.com',
  :password => '123123',
  :password_confirmation => '123123',
  :remember_me => true,
  :role => 'Default'
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
    :cost => 2.43,
    :size => '750g',
    :price => 49.99,
    :brand => 'Coles',
    :active => true,
    :barcode => 12093812,
    :supplier => Supplier.first,
    :description => 'signature product.'
},{
    :name => 'Wen Di',
    :cost => 9001.00,
    :size => '38kg',
    :brand => "Lim's Home made people",
    :price => 2.99,
    :active => true,
    :barcode => 29034983,
    :supplier => Supplier.last,
    :description => '...'
},{
    :name => 'Speed',
    :cost => 10.00,
    :size => '10 g',
    :brand => 'Streets',
    :price => 99.99,
    :active => true,
    :barcode => 69696969,
    :supplier => Supplier.last,
    :description => 'Get that high on'
},{
:name => 'Donec',
:cost =>70,
:size => '143g',
:price => 35,
:brand => 'Dante Dudley',
:active => false,
:barcode => 'FQN69YTW1DP',
:supplier => Supplier.first,
:description => '
nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus
'
},{
:name => 'pellentesque',
:cost =>14,
:size => '509g',
:price => 55,
:brand => 'David Chapman',
:active => true,
:barcode => 'AGI69MAF7HK',
:supplier => Supplier.first,
:description => '
aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim
'
},{
:name => 'ac',
:cost =>77,
:size => '742g',
:price => 16,
:brand => 'Warren Whitfield',
:active => true,
:barcode => 'KYW60LFJ5SJ',
:supplier => Supplier.last,
:description => 'eget'
},{
:name => 'Etiam',
:cost =>50,
:size => '44g',
:price => 98,
:brand => 'Colorado Glover',
:active => false,
:barcode => 'OEM89HAX2UH',
:supplier => Supplier.first,
:description => 'elit, pharetra ut, pharetra sed, hendrerit a'
},{
:name => 'Morbi',
:cost =>7,
:size => '153g',
:price => 64,
:brand => 'Macon Stevenson',
:active => true,
:barcode => 'MXA23BGQ4QF',
:supplier => Supplier.last,
:description => 'scelerisque'
},{
:name => 'Donec',
:cost =>39,
:size => '55g',
:price => 40,
:brand => 'Louis Shepherd',
:active => true,
:barcode => 'VMR15VTF7TR',
:supplier => Supplier.last,
:description => '
Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus
'
},{
:name => 'nec',
:cost =>84,
:size => '165g',
:price => 63,
:brand => 'Damon Salazar',
:active => true,
:barcode => 'VXW32YTY7LT',
:supplier => Supplier.first,
:description => 'enim'
},{
:name => 'pellentesque,',
:cost =>92,
:size => '572g',
:price => 99,
:brand => 'Leonard Hall',
:active => true,
:barcode => 'FDP29UWG6RB',
:supplier => Supplier.last,
:description => 'magna. Phasellus dolor elit, pellentesque a,'
},{
:name => 'Etiam',
:cost =>48,
:size => '143g',
:price => 71,
:brand => 'Curran Mcfadden',
:active => false,
:barcode => 'MRJ26ZGF3YL',
:supplier => Supplier.last,
:description => 'magna nec quam. Curabitur vel lectus.'
},{
:name => 'lectus',
:cost =>34,
:size => '470g',
:price => 74,
:brand => 'Valentine Compton',
:active => true,
:barcode => 'LTF22KYL9KY',
:supplier => Supplier.last,
:description => 'Duis sit amet diam eu dolor egestas rhoncus.'
},{
:name => 'nostra,',
:cost =>75,
:size => '455g',
:price => 49,
:brand => 'Bradley Hood',
:active => true,
:barcode => 'QZP13DWG3RR',
:supplier => Supplier.first,
:description => '
sit amet luctus vulputate, nisi sem semper erat, in
'
},{
:name => 'faucibus.',
:cost =>28,
:size => '754g',
:price => 73,
:brand => 'Dane Dillard',
:active => true,
:barcode => 'XAX17LRW8PM',
:supplier => Supplier.last,
:description => 'pretium aliquet, metus'
},{
:name => 'quis',
:cost =>36,
:size => '427g',
:price => 41,
:brand => 'Micah Campbell',
:active => false,
:barcode => 'TAZ03VTO0LM',
:supplier => Supplier.first,
:description => 'fringilla ornare placerat, orci'
},{
:name => 'ipsum',
:cost =>78,
:size => '306g',
:price => 69,
:brand => 'Logan Weaver',
:active => false,
:barcode => 'MEU65HBF4DZ',
:supplier => Supplier.first,
:description => 'purus, accumsan'
},{
:name => 'congue,',
:cost =>95,
:size => '676g',
:price => 32,
:brand => 'Addison Cohen',
:active => true,
:barcode => 'COL93UPY7UL',
:supplier => Supplier.last,
:description => 'fames ac turpis egestas. Fusce aliquet'
},{
:name => 'convallis',
:cost =>85,
:size => '96g',
:price => 69,
:brand => 'Damon Dejesus',
:active => true,
:barcode => 'SJR42KTI5OK',
:supplier => Supplier.first,
:description => 'arcu.'
},{
:name => 'amet,',
:cost =>81,
:size => '802g',
:price => 41,
:brand => 'Kadeem Newton',
:active => true,
:barcode => 'MGX90AQI2HA',
:supplier => Supplier.last,
:description => '
molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris.
'
},{
:name => 'ultricies',
:cost =>36,
:size => '208g',
:price => 20,
:brand => 'Wallace Rivers',
:active => true,
:barcode => 'CUX55UYD4TP',
:supplier => Supplier.last,
:description => 'sed libero. Proin sed turpis nec mauris'
},{
:name => 'Nulla',
:cost =>68,
:size => '162g',
:price => 10,
:brand => 'Trevor Jacobs',
:active => false,
:barcode => 'NKP37VOS6EV',
:supplier => Supplier.first,
:description => 'dui,'
},{
:name => 'neque',
:cost =>83,
:size => '248g',
:price => 12,
:brand => 'Dante Barrera',
:active => true,
:barcode => 'YSH63LUH9YU',
:supplier => Supplier.first,
:description => 'malesuada ut, sem. Nulla interdum. Curabitur'}])

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

Sale.create([{
    :status => 'Finished',
    :discount => 0,
    :customer => User.offset(rand(User.count)).first,
    :checkout_user => User.offset(rand(User.count)).first
},{
    :status => 'Finished',
    :discount => 0,
    :customer => User.offset(rand(User.count)).first,
    :checkout_user => User.offset(rand(User.count)).first
},{
    :status => 'Adding to Cart',
    :discount => 0,
    :customer => User.offset(rand(User.count)).first,
    :checkout_user => User.offset(rand(User.count)).first
},{
    :status => 'Checking Out',
    :discount => 0,
    :customer => User.offset(rand(User.count)).first,
    :checkout_user => User.offset(rand(User.count)).first
}])

Product.all.each do |product|
    Sale.all.each do |sale|
        quantity = rand(6) + 1
        SaleItem.create({
            :sale => sale,
            :product => product,
            :quantity => quantity,
            :sub_total => quantity * product.price
        })
    end
end

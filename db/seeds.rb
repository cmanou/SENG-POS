# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{
    :email => 'manager@pos.com',
    :password => '123123',
    :password_confirmation => '123123',
    :remember_me => true
},{
    :email => 'checkout@pos.com',
    :password => '123123',
    :password_confirmation => '123123',
    :remember_me => true
},{
    :email => 'stock@pos.com',
    :password => '123123',
    :password_confirmation => '123123',
    :remember_me => true
},{
    :email => 'report@pos.com',
    :password => '123123',
    :password_confirmation => '123123',
    :remember_me => true
}])

StockLocation.create([{ :name => 'Warehouse' }])
StockLocation.create([{:name => 'Backroom', :previous_location => StockLocation.last}])
StockLocation.create([{:name => 'Floor', :previous_location => StockLocation.last}])


Supplier.create([{
    :name => 'ChinWorks',
    :contact_person => 'Chin Wang',
    :contact_number => '61-2-8339-9188'
},{
    :name => 'VincentWorks',
    :contact_person => 'Vincent Wong',
    :contact_number => '61-2-9999-8888'
},{
    :name => 'Sams Organic Sex Supplies',
    :contact_person => 'Sam Li',
    :contact_number => '61-2-9385-5356'
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

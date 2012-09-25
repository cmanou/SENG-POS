# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{
    :email => 'support@derpinasoft.com',
    :password => 'outsourced',
    :password_confirmation => 'outsourced',
    :remember_me => true
},{
    :email => 'ck.vincentwong@gmail.com',
    :password => '1337haxor',
    :password_confirmation => '1337haxor',
    :remember_me => false
}])

StockLocation.create([{ :name => 'Floor' }, { :name => 'Backroom' }, { :name => 'Warehouse' }])
Supplier.create({
    :name => 'ChinWorks',
    :contact_person => 'Chin Wang',
    :contact_number => '61-2-8339-9188'
})

Product.create([{
    :name => 'Bread',
    :cost => 2.43,
    :size => '750g',
    :price => 49.99,
    :active => true,
    :barcode => 12093812,
    :supplier => Supplier.first,
    :description => 'signature product.'
},{
    :name => 'Wen Di',
    :cost => 9001.00,
    :size => '38kg',
    :price => 2.99,
    :active => true,
    :barcode => 29034983,
    :supplier => Supplier.first,
    :description => '...'
}])

StockLocation.all.each do |location|
    Product.all.each do |product|
        StockLevel.create({
            :product => product,
            :stock_location => location,
            :quanity => 20,
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
        quanity = rand(6) + 1
        SaleItem.create({
            :sale => sale,
            :product => product,
            :quantity => quanity,
            :sub_total => quanity * product.price
        })
    end
end

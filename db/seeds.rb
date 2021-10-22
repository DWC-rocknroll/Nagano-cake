# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'ss@sss', password: '123456')
Customer.create(email:'aa@aaa', password:'123456',first_name:"道子", last_name:"令和", first_name_kana:'ミチコ', last_name_kana:'レイワ', is_active:true, postcode:"1234567", residence:"神奈川県", phone_number:"00000000000")
Delivery.create(customer_id:1, name:'令和道子', postcode:'123456', address:'東京都' )
Order.create(customer_id: 1, postage: 800, total_price: 1000, payment_method: 1, name: '令和道子', deliveries_postcode: '1234567', address: '東京都', status: 1)
Genre.create([{name:'ケーキ'}, {name:'プリン'}, {name:'焼き菓子'}])
Product.create(
    genre_id:1,
    name:'ショートケーキ',
    introduction:'美味しいショートケーキです。',
    tax_out_price:800,
    image: open("./app/assets/images/cake.png"),
    is_sale_active:true,
  )
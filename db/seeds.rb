# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Item.destroy_all
Category.destroy_all

organ = Category.create!(title: "Organs", image: "https://i.imgur.com/p8HIlRr.jpg")
weapons = Category.create!(title: "Weapons", image: "https://i.imgur.com/GLaydj2.jpg")
vehicles = Category.create!(title: "Vehicles", image: "http://media.caranddriver.com/images/media/51/2017-10best-lead-photo-672628-s-original.jpg")
nuclear_weapons = Category.create!(title: "Nuclear Weapons", image: "https://i.imgur.com/DJHRrOt.jpg")


organ.items.create!(title: "Heart",
            description: "All of our hearts will eventually wear out. Why let yours?",
            price: 25499,
            image: "http://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/image_article_collections/anatomy_pages/heart_illustration.jpg"
            )
organ.items.create!(title: "Liver",
            description: "All that drinking of expensive alchol is gonna take down your liver. Just get a new one, and keep on drinking!",
            price: 34,
            image: "http://www.pcosnutrition.com/wp-content/uploads/2014/12/Liver-original-Getty.jpg"
            )
organ.items.create!(title: "Brain",
            description: "Thinking causes wear and tear. Despite how little you do, you'll need a new brain some day!",
            price: 25234499,
            image: "https://img.purch.com/h/1000/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzAzOS84NDcvb3JpZ2luYWwvc2h1dHRlcnN0b2NrXzEwMTAwMDcwNy5qcGc="
            )

weapons.items.create!(title: "Power-Armor",
            description: "The perfect Robo-cop halloween costume, watch out, it has live ammunition!",
            price: 1225499,
            image: "http://i.imgur.com/WvSrZ9M.png"
            )

weapons.items.create!(title: "Chris - the living weapon",
            description: "It's supposedly a powerful gun, it is an actual slug, don't forget to wash your hands.",
            price: 3400000,
            image: "http://i.imgur.com/vzQ02tE.png"
            )

weapons.items.create!(title: "Boring Regular Standard Shoot Em Up Guns",
            description: "Shoot things.. not living things, that's mean.  It's also against the law... in most countries",
            price: 5045,
            image: "http://i.imgur.com/NQQVycZ.jpg"
            )

vehicles.items.create!(title: "Space Cruiser",
            description: "When you need to cruise around space, guranteed to work; straight from Area 51",
            price: 1999999,
            image: "http://i.imgur.com/d6riNk1.png"
            )

vehicles.items.create!(title: "Actual Transformers Vehicle",
            description: "Has the world gone to shit?  Your locals trying to kill you and there is no more society to protect you?  Get an autobots vehicle and protect yourself!!",
            price: 40000000,
            image: "http://i.imgur.com/fJPSXHs.jpg"
            )

vehicles.items.create!(title: "Doctors Box",
            description: "Ready to time travel and visit new places? Very spacious interior.  *Next purchase (limit of one item) is free if you go back and stop Trump from winning!*",
            price: 125234499,
            image: "http://i.imgur.com/Wv2U4j2.jpg"
            )

nuclear_weapons.items.create!(title: "Range of Nukes",
            description: "Depending on the level of destruction you want, the price will go up.",
            price: 9999999,
            image: "https://i.kinja-img.com/gawker-media/image/upload/s--IhsP1xMg--/c_scale,fl_progressive,q_80,w_800/bkyiwqpnme88tbr1tda2.gif"
            )

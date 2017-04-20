# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Invoice.destroy_all
Order.destroy_all
User.destroy_all
Item.destroy_all
Category.destroy_all


User.create!(first_name: "Ad", last_name: "min", email: "admin@admin.com", password: "admin1", password_confirmation: "admin1", role: 1)
User.create!(first_name: "Regular", last_name: "min", email: "user@user.com", password: "user", password_confirmation: "user", role: 0)
User.create!(first_name: "Joe", last_name: "Schmo", email: "joe@joe.com", password: "joe", password_confirmation: "joe", role: 0)
organ = Category.create!(title: "Organs", image: "https://i.imgur.com/p8HIlRr.jpg")
weapons = Category.create!(title: "Weapons", image: "https://i.imgur.com/GLaydj2.jpg")
vehicles = Category.create!(title: "Vehicles", image: "http://media.caranddriver.com/images/media/51/2017-10best-lead-photo-672628-s-original.jpg")
nuclear_weapons = Category.create!(title: "Nuclear Weapons", image: "https://i.imgur.com/DJHRrOt.jpg")
User.first.orders.create(status: "ordered")
User.first.orders.create(status: "completed")
User.first.orders.create(status: "paid")
User.first.orders.create(status: "cancelled")


organ.items.create!(title: "Heart",
            description: "All of our hearts will eventually wear out. Why let yours?",
            price: 25499,
            image: "heart.jpg"

            )
organ.items.create!(title: "Liver",
            description: "All that drinking of expensive alchol is gonna take down your liver. Just get a new one, and keep on drinking!",
            price: 34,
            image: "liver.jpg"
            )
organ.items.create!(title: "Brain",
            description: "Thinking causes wear and tear. Despite how little you do, you'll need a new brain some day!",
            price: 25234499,
            image: "brain.jpg"
            )

weapons.items.create!(title: "Power-Armor",
            description: "The perfect Robo-cop halloween costume, watch out, it has live ammunition!",
            price: 1225499,
            image: "power_armor.png"
            )

weapons.items.create!(title: "Chris - the living weapon",
            description: "It's supposedly a powerful gun, it is an actual slug, don't forget to wash your hands.",
            price: 3400000,
            image: "chris_living_weapon.png"
            )

weapons.items.create!(title: "Boring Regular Standard Shoot Em Up Guns",
            description: "Shoot things.. not living things, that's mean.  It's also against the law... in most countries",
            price: 5045,
            image: "gun.jpg"
            )

vehicles.items.create!(title: "Space Cruiser",
            description: "When you need to cruise around space, guranteed to work; straight from Area 51",
            price: 1999999,
            image: "space_cruiser.png"
            )

vehicles.items.create!(title: "Actual Transformers Vehicle",
            description: "Has the world gone to shit?  Your locals trying to kill you and there is no more society to protect you?  Get an autobots vehicle and protect yourself!!",
            price: 40000000,
            image: "transformers_car.jpg"
            )

vehicles.items.create!(title: "Doctors Box",
            description: "Ready to time travel and visit new places? Very spacious interior.  *Next purchase (limit of one item) is free if you go back and stop Trump from winning!*",
            price: 125234499,
            image: "dr_who_box.jpg"
            )

nuclear_weapons.items.create!(title: "Range of Nukes",
            description: "Depending on the level of destruction you want, the price will go up.",
            price: 9999999,
            image: "nuclear_weapons.gif"
            )

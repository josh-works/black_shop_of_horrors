# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Item.destroy_all
Package.destroy_all
# Item.destroy_all
Package.create!(username: "Carl", id: 1)
Category.create!(title: "Organs", image: "http://theamishworkshop.com/uploads/7/5/1/2/75128337/fanbackcombo_orig.jpg")
Category.create!(title: "Seth's hair follicles", image: "https://www.cellapplications.com/sites/default/files/Hair.jpg")
Category.create!(title: "Biological Weapons", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/WMD-biological.svg/200px-WMD-biological.svg.png")
Category.create!(title: "Plumbus", image: "https://www.thinkgeek.com/images/products/zoom/ivns_plumbus.jpg")

Item.create(title: "Heart",
            description: "All of our hearts will eventually wear out. Why let yours?",
            price: 25499,
            image: "http://www.sciencemadesimple.co.uk/files/2016/10/sn-pigheart.jpg",
            category_id: 1,
            package_id: 1
            )
Item.create(title: "Liver",
            description: "All of our hearts will eventually wear out. Why let yours?",
            price: 34,
            image: "http://www.sciencemadesimple.co.uk/files/2016/10/sn-pigheart.jpg",
            category_id: 1,
            package_id: 1
            )
Item.create(title: "Brain",
            description: "All of our hearts will eventually wear out. Why let yours?",
            price: 25234499,
            image: "http://www.sciencemadesimple.co.uk/files/2016/10/sn-pigheart.jpg",
            category_id: 1,
            package_id: 1
            )

# Item.create!(title: "", description: "", image: "", price: "")

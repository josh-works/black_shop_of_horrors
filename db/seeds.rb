# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
# Item.destroy_all

Category.create!(title: "Chris's lawn furniture", image: "http://theamishworkshop.com/uploads/7/5/1/2/75128337/fanbackcombo_orig.jpg")
Category.create!(title: "Seth's hair follicles", image: "https://www.cellapplications.com/sites/default/files/Hair.jpg")
Category.create!(title: "Biological Weapons", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/WMD-biological.svg/200px-WMD-biological.svg.png")
Category.create!(title: "Plumbus", image: "https://www.thinkgeek.com/images/products/zoom/ivns_plumbus.jpg")
Category.create!(title: "Josh's limbs", image: "https://ca.slack-edge.com/T029P2S9M-U38EDMUCE-bf26ea5fd4a9-1024")
Category.create!(title: "Josh's organs", image: "https://ca.slack-edge.com/T029P2S9M-U38EDMUCE-bf26ea5fd4a9-1024")


# Item.create!(title: "", description: "", image: "", price: "")

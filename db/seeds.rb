# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(:image_url => "mountainbike.jpg", :name => "Mountain Bike", :description => "A bicycle with a light sturdy frame, broad deep-treaded tires, and multiple gears, originally designed for riding on mountainous terrain.", :price => 52)
Product.create(:image_url => "roadbike.jpg", :name => "Road Bike", :description => "Road bikes are made specifically to ride over concrete and other paved roads, and are often used in long road trips and also commuting on a daily basis.", :price => 42)
Product.create(:image_url => "tandembike.jpg", :name => "Tandem Bike", :description => "The tandem bicycle or twin is a form of bicycle (occasionally a tricycle) designed to be ridden by more than one person. The term tandem refers to the seating arrangement (fore to aft, not side by side), not the number of riders. ", :price => 62)
Product.create(:image_url => "tricyclebike.jpg", :name => "Tricycle", :description => "An adult tricycle is a three-wheeled cycle that can be powered by foot pedals and is popular with baby-boomers and seniors, as well as people with balance problems or handicaps.", :price => 50)
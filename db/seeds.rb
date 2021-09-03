# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "================="
puts "Creating books"

Book.find_or_create_by(name: "Eleanor Oliphant is Completely Fine")
Book.find_or_create_by(name: "Half of a Yellow Sun")
Book.find_or_create_by(name: "A Gathering Light")
Book.find_or_create_by(name: "David and Goliath")
Book.find_or_create_by(name: "Weapons of Math Destruction")

puts "Creating user"
User.find_or_create_by(name: "Book Lover", email: "bok_lover@example.org")
puts "Done"
puts "================"

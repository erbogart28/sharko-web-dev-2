# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(FullName:  "sharko",
             email: "admin@sharko.com",
             password:              "password",
             PhoneNumber: "123456789",
            admin: true
             )
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(FullName:  name,
               email: email,
               password:              password,
               PhoneNumber: password)
end
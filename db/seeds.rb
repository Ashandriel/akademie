# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def create_user(email)
  User.create!(
    email:  email,
    username: 'admin',
    password: "admin",
    role: 'admin'

  )
end

#fake  users
1.times do |i|
  create_user("admin@admin.com")
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# db/seeds.rb

# Erstelle einige Kategorien
Category.find_or_create_by!(name: 'Videos')
Category.find_or_create_by!(name: 'Kolumnen')
Category.find_or_create_by!(name: 'Lebensgeschichten')

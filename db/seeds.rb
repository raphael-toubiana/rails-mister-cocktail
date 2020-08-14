# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'JSON'
require 'open-uri'

puts 'Destroying all existing ingredients & cocktails...'
puts '-------'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Done !'
puts 'Seeding 100 ingredients ...'
puts '-------'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
objs = JSON.parse(json)
ingredients = []

objs['drinks'].each do |element|
  element.each do |key, value|
    ingredients << value
  end
end

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end
puts 'Done !'

puts "########################################"

puts "Seed 3 cocktails"
mojito = Cocktail.create(name: "mojito")
whiskey_sour = Cocktail.create(name: "whiskey sour")
gin_tonic = Cocktail.create(name: "gin tonic")
puts "Done !"

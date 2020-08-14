# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
Ingredient.destroy_all
puts "ingredients creation"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
data = JSON.parse(json)
drinks = data["drinks"]
drinks.each do |drink|
  a = drink["strIngredient1"]
  Ingredient.create!(name: a)
end
puts "ingredient creation done ! I start the cocktails"
cocktails = ("odkeau, Bloody Mary, Russe blanc, Octobre rouge, Russe noir, Screwdriver, Trou noir, Chien enragé, PPP, Sex on the beach, Blue Lagoon, Cosmopolitan").split(",")
cocktails.each do |cocktail|
  Cocktail.create(name: cocktail)
end

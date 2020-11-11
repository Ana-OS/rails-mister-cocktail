# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Destroy ingredients"
Ingredient.destroy_all

puts "Destroy Cocktails"
Cocktail.destroy_all

puts "Create ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |ingredient|

 new_ingredient = Ingredient.create(name: ingredient['strIngredient1'])
 puts"added #{new_ingredient.name}"
end


ing1 = Ingredient.create(name: "Mint leaves")
ing2 = Ingredient.create(name: "Soda")

puts "also created #{ing1.name} and #{ing2.name}"

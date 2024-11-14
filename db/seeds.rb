# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Ingredientes
ingredients = Ingredient.create([
  { name: 'Tomate', measure: :gr },
  { name: 'Cebolla', measure: :gr },
  { name: 'Pimiento', measure: :gr },
  { name: 'Pollo', measure: :gr },
  { name: 'Arroz', measure: :gr },
  { name: 'Frijoles', measure: :gr },
  { name: 'Aceite', measure: :ml },
  { name: 'Sal', measure: :gr },
  { name: 'Pimienta', measure: :gr },
  { name: 'Huevo', measure: :un },
  { name: 'Papa', measure: :gr }
])

# Recetas
recipes = Recipe.create([
  { name: 'Pollo al curry', number_people: 4, description: 'Receta de pollo al curry con arroz y verduras' },
  { name: 'Ensalada de frutas', number_people: 2, description: 'Ensalada de frutas frescas con jugo de naranja' },
  { name: 'Sopa de frijoles', number_people: 6, description: 'Sopa de frijoles con verduras y especias' },
  { name: 'Tortilla de patatas', number_people: 4, description: 'Tortilla de huevos con papas'}
])
# Asociaciones entre recetas e ingredientes
RecipeIngredient.create([
  { recipe_id: recipes[0].id, ingredient_id: ingredients[0].id, amount: 2.0 },
  { recipe_id: recipes[0].id, ingredient_id: ingredients[1].id, amount: 1.0 },
  { recipe_id: recipes[0].id, ingredient_id: ingredients[2].id, amount: 1.0 },
  { recipe_id: recipes[0].id, ingredient_id: ingredients[3].id, amount: 1.0 },
  { recipe_id: recipes[1].id, ingredient_id: ingredients[4].id, amount: 1.0 },
  { recipe_id: recipes[1].id, ingredient_id: ingredients[5].id, amount: 1.0 },
  { recipe_id: recipes[2].id, ingredient_id: ingredients[6].id, amount: 2.0 },
  { recipe_id: recipes[2].id, ingredient_id: ingredients[7].id, amount: 1.0 },
  { recipe_id: recipes[3].id, ingredient_id: ingredients[8].id, amount: 3.0 },
  { recipe_id: recipes[3].id, ingredient_id: ingredients[9].id, amount: 2.0 },
  { recipe_id: recipes[3].id, ingredient_id: ingredients[6].id, amount: 5.0 }
])
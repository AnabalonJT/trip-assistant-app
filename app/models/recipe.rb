class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_trips
  has_many :trips, through: :recipe_trips

  def calculate_ingredients(trip)
    ingredients = {}
    recipe_ingredients.each do |recipe_ingredient|
      ingredient = recipe_ingredient.ingredient
      quantity = recipe_ingredient.amount
      scale_factor = trip.users.count.to_f / number_people
      ingredients[ingredient] = (quantity * scale_factor).round(2)
    end
    ingredients
  end
  
end

class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :forbidden_food_users
  has_many :users, through: :forbidden_food_users
  has_many :recipe_trips
  has_many :trips, through: :recipe_trips
end

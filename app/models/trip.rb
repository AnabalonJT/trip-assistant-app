class Trip < ApplicationRecord
  has_many :assignations_to_buy
  has_many :expenses
  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :recipe_trips
  has_many :recipes, through: :recipe_trips
end

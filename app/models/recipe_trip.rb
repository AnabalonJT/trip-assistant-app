class RecipeTrip < ApplicationRecord
  belongs_to :recipe
  belongs_to :trip
end

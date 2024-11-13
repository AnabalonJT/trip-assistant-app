class ForbiddenFoodUser < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
end

class AssignationToBuy < ApplicationRecord
  belongs_to :ingredient
  belongs_to :user
  belongs_to :trip
end

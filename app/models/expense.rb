class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :trip
end

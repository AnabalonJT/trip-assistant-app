class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_trips
  has_many :trips, through: :user_trips
  has_many :expenses
  has_many :forbidden_food_users
  has_many :forbidden_ingredients, through: :forbidden_food_users, source: :ingredient
  has_many :assignations_to_buy
         
end

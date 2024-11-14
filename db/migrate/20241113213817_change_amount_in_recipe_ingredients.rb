class ChangeAmountInRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    change_column :recipe_ingredients, :amount, :float
  end
end

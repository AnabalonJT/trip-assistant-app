class AddMeasureToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :measure, :integer, default: 0

    add_index :ingredients, :measure

    Ingredient.reset_column_information
  end
end

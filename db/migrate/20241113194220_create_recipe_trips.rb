class CreateRecipeTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_trips do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end

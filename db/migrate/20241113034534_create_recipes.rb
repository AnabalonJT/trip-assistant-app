class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :number_people
      t.text :description

      t.timestamps
    end
  end
end

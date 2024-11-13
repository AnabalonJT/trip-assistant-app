class CreateAssignationToBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :assignation_to_buys do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.boolean :verified

      t.timestamps
    end
  end
end

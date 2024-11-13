json.extract! recipe, :id, :name, :number_people, :description, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)

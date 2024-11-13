json.extract! recipe_trip, :id, :recipe_id, :trip_id, :created_at, :updated_at
json.url recipe_trip_url(recipe_trip, format: :json)

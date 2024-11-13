json.extract! expense, :id, :user_id, :trip_id, :amount, :picture, :created_at, :updated_at
json.url expense_url(expense, format: :json)

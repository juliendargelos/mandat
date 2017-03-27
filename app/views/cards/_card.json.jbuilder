json.extract! card, :id, :title, :desc, :budget, :employers, :population, :created_at, :updated_at
json.url card_url(card, format: :json)

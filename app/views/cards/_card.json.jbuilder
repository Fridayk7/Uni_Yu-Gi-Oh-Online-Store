json.extract! card, :id, :name, :card_type, :level, :race, :card_attribute, :atk, :def, :created_at, :updated_at
json.url card_url(card, format: :json)

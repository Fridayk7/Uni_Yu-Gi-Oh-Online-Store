json.extract! address, :id, :street, :city, :postcode, :user_id, :created_at, :updated_at
json.url address_url(address, format: :json)

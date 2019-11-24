json.extract! payment, :id, :amount, :credit_card_id, :user_id, :order_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)

class Payment < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :credit_card
  belongs_to :user
  belongs_to :address
end

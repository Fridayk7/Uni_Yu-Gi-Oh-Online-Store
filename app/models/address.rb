class Address < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy
  validates :street , :city, :postcode ,:user_id, presence: true
end

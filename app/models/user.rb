class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :addresses, dependent: :destroy
  validates :name,  presence: true, length:{maximum: 50 }
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 75 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }
has_secure_password
validates :password, presence: true, length: { minimum: 6}
end

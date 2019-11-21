class CreditCard < ApplicationRecord
  belongs_to :user
  validates :exp_date, :number, :name_on_card,:organisation, presence: true
enum organisation: {
    "American Express" => "AmericanExpress",
    "Visa" => "Visa",
    "MasterCard" => "MasterCard"
  }
end

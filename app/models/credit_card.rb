class CreditCard < ApplicationRecord
  belongs_to :user
  validates :exp_date, :number, :name_on_card,:organisation, presence: true
enum organisation: {
    "American Express" => "AmericanExpress",
    "Visa" => "Visa",
    "MasterCard" => "MasterCard"
  }
  def last_four_digits
    "****" + self.number[-4..-1].to_s
  end
end

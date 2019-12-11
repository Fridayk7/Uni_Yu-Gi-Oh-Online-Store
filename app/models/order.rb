class Order < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  belongs_to :payment, optional:true
  validates :quantity,:numericality => { :greater_than => 0 }, presence: true
end

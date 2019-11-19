class Stock < ApplicationRecord
  belongs_to :card
  belongs_to :yugioh_set
end

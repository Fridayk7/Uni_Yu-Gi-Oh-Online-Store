class Stock < ApplicationRecord
  belongs_to :card
  belongs_to :yugioh_set
  def self.search(term,card_id)
    if term
      where('card_id LIKE ?',"#{card_id.id}")
    else
      all
    end
  end

end

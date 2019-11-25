class Stock < ApplicationRecord
  belongs_to :card
  belongs_to :yugioh_set
  scope :print_tag, -> (print_tag) { where print_tag: print_tag }
  scope :price, -> (price) { where price: price }
  scope :quantity, -> (quantity) { where(quantity: quantity)}
    scope :yugioh_set_id, -> (yugioh_set_id) { where(yugioh_set_id: yugioh_set_id)}
  def self.search(term,card_id)
    if term && card_id
      where('card_id LIKE ?',"#{card_id.id}")
    else
    all
    end
  end
end

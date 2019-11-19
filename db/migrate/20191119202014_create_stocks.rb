class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :card, foreign_key: true
      t.references :yugioh_set, foreign_key: true
      t.string :print_tag
      t.string :price
      t.string :quantity

      t.timestamps
    end
  end
end

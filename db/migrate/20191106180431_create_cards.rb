class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :card_type
      t.integer :level
      t.string :race
      t.string :card_attribute
      t.integer :atk
      t.integer :def

      t.timestamps
    end
  end
end

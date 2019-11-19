class CreateYugiohSets < ActiveRecord::Migration[5.2]
  def change
    create_table :yugioh_sets do |t|
      t.string :name
      t.string :code
      t.string :year

      t.timestamps
    end
  end
end

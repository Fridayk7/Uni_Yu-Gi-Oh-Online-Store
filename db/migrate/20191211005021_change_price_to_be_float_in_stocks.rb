class ChangePriceToBeFloatInStocks < ActiveRecord::Migration[5.2]
  def change
     change_column :stocks, :price, :decimal, :precision => 8, :scale => 2
  end
end

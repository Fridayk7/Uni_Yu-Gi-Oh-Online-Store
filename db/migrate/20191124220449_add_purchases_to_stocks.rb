class AddPurchasesToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :purchases, :integer
  end
end

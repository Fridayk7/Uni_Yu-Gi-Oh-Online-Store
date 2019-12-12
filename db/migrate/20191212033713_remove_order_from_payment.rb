class RemoveOrderFromPayment < ActiveRecord::Migration[5.2]
  def change
    remove_reference :payments, :order, foreign_key: true
  end
end

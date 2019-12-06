class AddPayDayToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :pay_day, :date
  end
end

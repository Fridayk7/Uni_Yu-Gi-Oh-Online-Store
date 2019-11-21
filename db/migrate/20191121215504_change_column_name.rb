class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :credit_cards, :password_digest, :number
  end
end

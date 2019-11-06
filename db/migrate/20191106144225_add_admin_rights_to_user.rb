class AddAdminRightsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Admin_rights, :boolean, default: false
  end
end

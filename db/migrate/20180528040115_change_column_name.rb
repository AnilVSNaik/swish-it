class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :password
  	rename_column :users, :password_disgest, :password_digest
  	add_column		:users, :remember_token, :string
  end
end

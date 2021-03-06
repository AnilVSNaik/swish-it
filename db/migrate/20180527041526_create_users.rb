class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_disgest
      t.string :first_name
      t.string :last_name
      t.string :username
      t.date :birthday

      t.timestamps
    end
  end
end

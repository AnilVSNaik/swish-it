class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
  	remove_column :tasks, :priority
  	add_column :tasks, :priority, :integer, default: 0
  end
end

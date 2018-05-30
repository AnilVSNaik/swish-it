class DeleteAddColumnToTasks < ActiveRecord::Migration[5.2]
  def change
  	remove_column :tasks, :is_complete
  	add_column :tasks, :is_complete, :boolean, default: false
  end
end

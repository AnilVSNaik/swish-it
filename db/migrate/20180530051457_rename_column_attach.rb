class RenameColumnAttach < ActiveRecord::Migration[5.2]
  def change
  	rename_column :tasks, :attach, :attaches
  end
end

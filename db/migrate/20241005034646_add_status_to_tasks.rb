class AddStatusToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :status, :integer, default: 0
  end
end

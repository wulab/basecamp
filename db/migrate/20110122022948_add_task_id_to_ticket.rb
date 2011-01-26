class AddTaskIdToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :task_id, :integer
  end

  def self.down
    remove_column :tickets, :task_id
  end
end

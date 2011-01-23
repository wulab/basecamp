class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.decimal :budget, :precision => 10, :scale => 2
      t.decimal :cost, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end

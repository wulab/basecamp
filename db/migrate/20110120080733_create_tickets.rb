class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.string :status
      t.date :due_date
      t.string :assigned_to
      t.string :opened_by

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end

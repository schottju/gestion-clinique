class ChangeColumnsInWorkingDays < ActiveRecord::Migration
  def change
    change_table :working_days do |t|
      t.remove :day, :start, :end
      t.column :monday, :boolean, default: false
      t.column :tuesday, :boolean, default: false
      t.column :wednesday, :boolean, default: false
      t.column :thursday, :boolean, default: false
      t.column :friday, :boolean, default: false
      t.column :saturday, :boolean, default: false
      t.column :sunday, :boolean, default: false
    end
  end
end

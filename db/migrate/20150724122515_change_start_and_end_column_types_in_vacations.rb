class ChangeStartAndEndColumnTypesInVacations < ActiveRecord::Migration
  def change
    change_column :vacations, :start, :date
    change_column :vacations, :end, :date
  end
end

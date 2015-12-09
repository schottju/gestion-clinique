class CreateWorkingDays < ActiveRecord::Migration
  def change
    create_table :working_days do |t|
      t.date :day
      t.time :start
      t.time :end
      t.references :veterinarian, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

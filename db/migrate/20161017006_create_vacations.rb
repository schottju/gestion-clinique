class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.datetime :start
      t.datetime :end
      t.references :veterinarian, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

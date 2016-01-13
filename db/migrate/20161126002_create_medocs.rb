class CreateMedocs < ActiveRecord::Migration
  def change
    create_table :medocs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

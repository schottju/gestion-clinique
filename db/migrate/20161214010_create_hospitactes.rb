class CreateHospitactes < ActiveRecord::Migration
  def change
    create_table :hospitactes do |t|
      t.text :comment
      t.text :soin
      t.references :veterinarian, index: true, foreign_key: true

      t.timestamps null: false      
    end
  end
end

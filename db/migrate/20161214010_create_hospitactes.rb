class CreateHospitactes < ActiveRecord::Migration
  def change
    create_table :hospitactes do |t|
      t.text :comment
      t.text :soin
      t.references :veterinarian, index: true, foreign_key: true
    end
  end
end

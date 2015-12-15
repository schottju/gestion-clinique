class CreateHospitActes < ActiveRecord::Migration
  def change
    create_table :hospit_actes do |t|
      t.text :comment
      t.text :soin
      t.references :veterinarian, index: true, foreign_key: true
    end
  end
end

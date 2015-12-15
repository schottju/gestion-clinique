class CreateHospitsTreatmentsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :hospits, :treatments do |t|
      t.index :treatment_id
      t.index :hospit_id
    end
  end
end

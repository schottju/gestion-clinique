class CreateMedicalRecordsTreatmentsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medical_records, :treatments do |t|
      t.index :treatment_id
      t.index :medical_record_id
    end
  end
end

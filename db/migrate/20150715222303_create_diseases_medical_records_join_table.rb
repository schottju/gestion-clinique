class CreateDiseasesMedicalRecordsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :diseases, :medical_records do |t|
      t.index :disease_id
      t.index :medical_record_id
    end
  end
end

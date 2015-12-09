class CreateMedicalRecordsFilesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medical_records, :files do |t|
      t.index :medical_record_id
      t.index :file_id
    end
  end
end

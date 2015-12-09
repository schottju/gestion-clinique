class DropMedicalRecordsFilesJoinTable < ActiveRecord::Migration
  def change
    drop_join_table :files, :medical_records
  end
end

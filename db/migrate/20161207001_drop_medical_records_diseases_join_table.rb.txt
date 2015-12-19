class DropMedicalRecordsDiseasesJoinTable < ActiveRecord::Migration
  def change
    drop_join_table :diseases, :medical_records
  end
end

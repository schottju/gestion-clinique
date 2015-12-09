class DropOldImagesMedicalRecordsJoinTable < ActiveRecord::Migration
  def change
    drop_join_table :images, :medical_records
  end
end

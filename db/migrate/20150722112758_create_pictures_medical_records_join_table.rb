class CreatePicturesMedicalRecordsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medical_records, :pictures do |t|
      t.index :medical_record_id
      t.index :picture_id
    end
  end
end

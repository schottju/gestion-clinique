class CreateMedicalRecordsImagesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medical_records, :images do |t|
      t.index :image_id
      t.index :medical_record_id
    end
  end
end

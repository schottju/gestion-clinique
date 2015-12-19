class CreateMedocsMedicalRecordsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medocs, :medical_records do |t|
      t.index :medoc_id
      t.index :medical_record_id
    end
  end
end

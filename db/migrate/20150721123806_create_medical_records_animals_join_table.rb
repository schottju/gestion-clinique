class CreateMedicalRecordsAnimalsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medical_records, :animals do |t|
      t.index :medical_record_id
      t.index :animal_id
    end
  end
end

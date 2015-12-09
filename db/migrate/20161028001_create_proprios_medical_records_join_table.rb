class CreatePropriosMedicalRecordsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :proprios, :medical_records do |t|
      t.index :proprio_id
      t.index :medical_record_id
    end
  end
end

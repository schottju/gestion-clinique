class CreateVeterinariansMedicalRecordsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :veterinarians, :medical_records do |t|
      t.index :veterinarian_id
      t.index :medical_record_id
    end
  end
end

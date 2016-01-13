class CreateMedicalRecordsCommentsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medical_records, :comments do |t|
      t.index :comment_id
      t.index :medical_record_id
    end
  end
end

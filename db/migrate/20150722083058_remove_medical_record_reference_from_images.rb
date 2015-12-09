class RemoveMedicalRecordReferenceFromImages < ActiveRecord::Migration
  def change
    remove_reference :images, :medical_record, index: true, foreign_key: true
  end
end

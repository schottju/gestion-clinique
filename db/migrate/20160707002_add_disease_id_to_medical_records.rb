class AddDiseaseIdToMedicalRecords < ActiveRecord::Migration
  def change
      add_reference :medical_records, :disease, index: true, foreign_key: true
    end
end

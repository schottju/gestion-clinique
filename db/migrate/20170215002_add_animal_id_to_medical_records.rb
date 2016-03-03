class AddAnimalIdToMedicalRecords < ActiveRecord::Migration
  def change
      add_reference :medical_records, :animal, index: true, foreign_key: true
    end
end

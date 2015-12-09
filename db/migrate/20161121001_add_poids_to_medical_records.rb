class AddPoidsToMedicalRecords < ActiveRecord::Migration
  def change
    add_column :medical_records, :poids, :string
  end
end

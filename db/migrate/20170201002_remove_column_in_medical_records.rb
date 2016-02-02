class RemoveColumnInMedicalRecords < ActiveRecord::Migration
  def change
    remove_column :medical_records, :additional_cost
    remove_column :medical_records, :total_cost
  end
end

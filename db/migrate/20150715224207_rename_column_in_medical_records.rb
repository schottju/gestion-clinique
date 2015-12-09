class RenameColumnInMedicalRecords < ActiveRecord::Migration
  def change
    rename_column :medical_records, :addictional_cost, :additional_cost
  end
end

class RemoveColumnInMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :unit_id
  end
end

class CreateMedicinesMedocsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medicines, :medocs do |t|
      t.index :medicine_id
      t.index :medoc_id
    end
  end
end

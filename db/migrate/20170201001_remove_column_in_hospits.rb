class RemoveColumnInHospits < ActiveRecord::Migration
  def change
    remove_column :hospits, :addictional_cost
    remove_column :hospits, :total_cost
  end
end

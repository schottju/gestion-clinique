class CreateHospitsHospitActesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :hospits, :hospit_actes do |t|
      t.index :hospit_acte_id
      t.index :hospit_id
    end
  end
end

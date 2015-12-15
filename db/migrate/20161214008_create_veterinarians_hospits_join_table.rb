class CreateVeterinariansHospitsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :veterinarians, :hospits do |t|
      t.index :veterinarian_id
      t.index :hospit_id
    end
  end
end

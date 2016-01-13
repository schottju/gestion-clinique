class CreateDiseasesHospitsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :diseases, :hospits do |t|
      t.index :disease_id
      t.index :hospit_id
    end
  end
end

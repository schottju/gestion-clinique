class AddDiseaseIdToHospits < ActiveRecord::Migration
  def change
      add_reference :hospits, :disease, index: true, foreign_key: true
    end
end

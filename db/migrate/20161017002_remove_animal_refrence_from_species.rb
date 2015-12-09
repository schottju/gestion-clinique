class RemoveAnimalRefrenceFromSpecies < ActiveRecord::Migration
  def change
    remove_reference :species, :animal, index: true, foreign_key: true
  end
end

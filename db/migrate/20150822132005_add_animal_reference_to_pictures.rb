class AddAnimalReferenceToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :animal, index: true, foreign_key: true
  end
end

class AddProprioReferenceToImages < ActiveRecord::Migration
  def change
    add_reference :images, :proprio, index: true, foreign_key: true
  end
end

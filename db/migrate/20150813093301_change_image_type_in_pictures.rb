class ChangeImageTypeInPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :image
    add_column :pictures, :image, :oid
  end
end

class RemoveImageDataFormPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :image_data
  end
end

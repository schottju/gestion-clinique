class RenameTableImagesToFiles < ActiveRecord::Migration
  def change
    rename_table :images, :files
  end
end

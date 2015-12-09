class ChangeColumnPwzInVeterinarians < ActiveRecord::Migration
  def change
    change_column :veterinarians, :pwz, :string
  end
end

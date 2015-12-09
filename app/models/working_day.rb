class WorkingDay < ActiveRecord::Base
  belongs_to :veterinarian

  def custom_label_method
    "##{id} #{'Lun' if monday} #{'Mar' if tuesday} #{'Mer' if wednesday} #{'Jeu' if thursday}
     #{'Ven' if friday} #{'Sam' if saturday} #{'Dim' if sunday}"
  end
end

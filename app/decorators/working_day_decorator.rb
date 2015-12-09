class WorkingDayDecorator < Draper::Decorator
  delegate_all

  def print_working_days
    "#{'Lun' if monday} #{'Mar' if tuesday} #{'Mer' if wednesday} #{'Jeu' if thursday}
     #{'Vend' if friday} #{'Sam' if saturday} #{'Dim' if sunday}"
  end
end

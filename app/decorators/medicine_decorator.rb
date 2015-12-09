class MedicineDecorator < Draper::Decorator
  delegate_all

  def amount_with_unit
    "#{h.number_with_delimiter(h.trim_float(amount), delimiter: " ", separator: ",")} #{self.try(:unit).try(:name)}"
  end

  def name_with_medoc
    "#{self.try(:medoc).try(:name)}"
  end

end

class MedicalRecordDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def name_of_disease
    "#{self.try(:disease).try(:name)}"
  end

  def consultation
    "#{medical_record.anamnesis}. #{medical_record.description}"
  end

  def name_of_animal
    "#{self.try(:animal_ids).try(:animal).try(:name)}"
  end

end

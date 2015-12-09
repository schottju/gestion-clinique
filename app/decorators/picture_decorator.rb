class PictureDecorator < Draper::Decorator
  delegate_all
  def print_animal_id
  print_animal_id = picture.try(:animal).try(:id_number) unless print_animal_id.nil?
  end
end

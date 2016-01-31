class Medicine < ActiveRecord::Base
  belongs_to :unit
  has_and_belongs_to_many :medical_records
  belongs_to :medoc

  def custom_label_method
    "##{id} #{name} #{medoc.try(:name)} #{unit.try(:name)}"
  end
end

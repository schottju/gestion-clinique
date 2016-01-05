class Medicine < ActiveRecord::Base
  belongs_to :unit
  has_and_belongs_to_many :medical_records
  belongs_to :medoc

#  accepts_nested_attributes_for :medocs

#  validates_presence_of  :amount, :unit_id

  def custom_label_method
    "##{id} #{amount} #{name} #{medoc.try(:name)}, quantité: #{amount} #{unit.try(:name)}"
  end
end

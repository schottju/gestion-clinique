class Comment < ActiveRecord::Base
  has_and_belongs_to_many :medical_records
  belongs_to :veterinarian
#  has_and_belongs_to_many :veterinarians
#  belongs_to :medoc

#  accepts_nested_attributes_for :medocs

#  validates_presence_of  :amount, :unit_id

end

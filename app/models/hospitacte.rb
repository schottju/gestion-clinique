class Hospitacte < ActiveRecord::Base
  has_and_belongs_to_many :hospits
  belongs_to :veterinarians  
#  belongs_to :medoc

#  accepts_nested_attributes_for :medocs

#  validates_presence_of  :amount, :unit_id

end

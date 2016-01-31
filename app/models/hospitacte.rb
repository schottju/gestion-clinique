class Hospitacte < ActiveRecord::Base
  belongs_to :hospits
  belongs_to :veterinarian
#  has_and_belongs_to_many :veterinarians

end

class Hospit < ActiveRecord::Base
  belongs_to :user
  belongs_to :veterinarian
  has_and_belongs_to_many :proprios
  has_and_belongs_to_many :animals
#  has_many :animal
  has_and_belongs_to_many :disease
  has_and_belongs_to_many :hospitactes
  has_and_belongs_to_many :veterinarians
  has_and_belongs_to_many :treatments
#  has_many :medocs
#  has_many :users
#  before_save :total_price
  validates_presence_of  :animal_ids
  accepts_nested_attributes_for :hospitactes, allow_destroy: true
#  accepts_nested_attributes_for :medocs


  def custom_label_method
    "#{user.try(:decorate).try(:full_name)}"
  end

  private

end

class MedicalRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :veterinarian
  belongs_to :animal
  belongs_to :proprio
  has_and_belongs_to_many :animals
  has_and_belongs_to_many :diseases
  has_and_belongs_to_many :medicines
  has_and_belongs_to_many :comments
  has_and_belongs_to_many :treatments
  has_and_belongs_to_many :pictures
  has_and_belongs_to_many :medocs
  belongs_to :disease
  validates_presence_of  :animal_ids
  accepts_nested_attributes_for :medicines, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true

  def total_price
    sum = medicines.inject(0.0) { |sum, medicine| sum  }
    sum += treatments.inject(0.0) { |sum, treatment| sum  }
    self.total_cost = additional_cost.to_f + sum
  end

  def custom_label_method
    "#{user.try(:decorate).try(:full_name)} #{disease.try(:name)}, Vétérinaire: #{veterinarian.try(:user).try(:decorate).try(:full_name)}"
  end

  private

end

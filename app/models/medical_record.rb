class MedicalRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :veterinarian
  belongs_to :proprios
  has_and_belongs_to_many :animals
#  has_many :animal
  has_and_belongs_to_many :diseases
  has_and_belongs_to_many :medicines
  has_and_belongs_to_many :comments
  has_and_belongs_to_many :treatments
  has_and_belongs_to_many :pictures
  has_many :medocs
  belongs_to :disease
#  has_many :users
  before_save :total_price

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

#    def self.search(query, proprio_id)
#     where("(id::varchar(255) like :q OR to_char(created_at, 'DD-MM-YYYY') like :q) AND user_id = :u", { q: "%#{query}%", u: proprio_id })
#   end
end

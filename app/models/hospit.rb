class Hospit < ActiveRecord::Base
  belongs_to :user
  belongs_to :veterinarian
  has_and_belongs_to_many :proprios
  has_and_belongs_to_many :animals
#  has_many :animal
  belongs_to :disease
  has_and_belongs_to_many :hospitactes
  has_and_belongs_to_many :veterinarians
  has_and_belongs_to_many :treatments
  has_and_belongs_to_many :pictures
#  has_many :medocs
#  has_many :users
#  before_save :total_price

  accepts_nested_attributes_for :hospitactes, allow_destroy: true
#  accepts_nested_attributes_for :medocs


  def custom_label_method
    "#{user.try(:decorate).try(:full_name)} #{disease.try(:name)}"
  end

  private

#    def self.search(query, proprio_id)
#     where("(id::varchar(255) like :q OR to_char(created_at, 'DD-MM-YYYY') like :q) AND user_id = :u", { q: "%#{query}%", u: proprio_id })
#   end
end

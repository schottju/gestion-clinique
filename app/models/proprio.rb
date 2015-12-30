class Proprio < ActiveRecord::Base
  include Gravtastic
#  gravtastic default: 'mm', secure: true, rating: 'PG'

#  belongs_to :veterinarians
#  has_one :addressp
  has_many :animals
  has_many :animal
  has_and_belongs_to_many :contacts
#  has_many :veterinarians
  has_many :medical_records
  has_many :hospits
  has_many :pictures
#  accepts_nested_attributes_for :addressp
  accepts_nested_attributes_for :contacts, allow_destroy: true
#  devise :database_authenticatable, :registerable,
#         :recoverable, :rememberable, :trackable, :validatable,
#         :confirmable, :lockable

  def custom_label_method
    "##{id}, nom: #{last_name}, prénom: #{first_name}"
  end


#    def self.search(query, proprio_id)
#      where("(lower(id_number) like :q OR lower(name) like :q) AND proprio_id = :u", { q: "%#{query.downcase}%", u: proprio_id })
#    end

    def trim(num)
      if num.blank?
        "Aucun"
      else
        i, f = num.to_i, num.to_f
        i == f ? i : f
      end
    end


end

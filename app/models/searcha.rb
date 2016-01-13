class Searcha < ActiveRecord::Base
  enum gender: [ :male, :femelle, :F_neutered, :M_neutered ]
  enum statut: [ :vivant, :DCD ]
  has_many :proprios
#  belongs_to :species
  has_many :animals
  has_many :animal
#  has_and_belongs_to_many :medical_records
#  has_and_belongs_to_many :hospits
#  validates_presence_of :gender, :species_id

#  def custom_label_method
#    "##{id} ID: #{id_number}, Nom: #{name}, Age: #{trim(age)}, Nombre: #{amount}, Espèce: #{species.try(:name)}"
#  end

  private

  def self.search(search)
      joins(:proprio).where("(lower(animals.name) LIKE ? or lower(animals.id_number) LIKE ?)", "%#{search}%", "%#{search}%")
  end

    def trim(num)
      if num.blank?
        "Aucun"
      else
        i, f = num.to_i, num.to_f
        i == f ? i : f
      end
    end
end

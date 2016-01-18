class Searcha < ActiveRecord::Base
  enum gender: [ :male, :femelle, :F_neutered, :M_neutered ]
  enum statut: [ :vivant, :DCD ]
  has_many :proprios
  has_many :animals
  has_many :animal

  private

  def self.search(query)
      where(:proprio).where("(lower(animals.name) ILIKE ? or lower(animals.id_number) ILIKE ?)", "%#{query.downcase}%", "%#{query.downcase}%")
  end

#    def trim(num)
#      if num.blank?
#        "Aucun"
#      else
#        i, f = num.to_i, num.to_f
#        i == f ? i : f
#      end
#    end
end

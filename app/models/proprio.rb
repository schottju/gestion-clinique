class Proprio < ActiveRecord::Base
  include Gravtastic
#  gravtastic default: 'mm', secure: true, rating: 'PG'
#  has_and_belongs_to_many :veterinarians
#  has_one :addressp
  has_many :animals
  has_many :animal
  has_and_belongs_to_many :contacts
  has_many :medical_records
  has_many :hospits
  has_many :pictures

  accepts_nested_attributes_for :contacts, allow_destroy: true

  def custom_label_method
    "##{id}, nom: #{last_name}, prénom: #{first_name}"
  end

  private

  def self.search(query)
    where("lower(last_name) like ?", "%#{query.downcase}%")
  end

end

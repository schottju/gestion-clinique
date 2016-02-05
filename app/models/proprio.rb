class Proprio < ActiveRecord::Base
  include Gravtastic

  has_many :animals
  has_many :animal
  has_and_belongs_to_many :contacts
  has_many :medical_records
  has_many :hospits
  has_many :pictures

#  accepts_nested_attributes_for :medicalrecs
  accepts_nested_attributes_for :contacts, allow_destroy: true
#  validates_presence_of :last_name
  def custom_label_method
    "##{id}, nom: #{last_name}, prénom: #{first_name}"
  end

  private

  def self.search(query)
    where("lower(last_name) ILIKE ?", "%#{query.downcase}%")
  end

end

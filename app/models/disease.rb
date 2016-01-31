class Disease < ActiveRecord::Base
  enum status: [ :actif, :inactif ]

  has_and_belongs_to_many :medical_records
  belongs_to :hospits

  validates_presence_of :name, :status

  def custom_label_method
    "##{id} #{name} #{"(inactif)" if status == "inactif"}"
  end

  private

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%")
  end
end

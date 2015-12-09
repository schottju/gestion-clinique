class Unit < ActiveRecord::Base
  enum status: [ :valide, :inactif ]

  has_many :medicines

  validates_presence_of :name, :status

  def custom_label_method
    "##{id} #{name} #{"(inactif)" if status == "inactif"}"
  end

  private

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%")
  end
end

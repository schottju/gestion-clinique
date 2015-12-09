class Address < ActiveRecord::Base
  belongs_to :user
  has_many :users

  validates_presence_of :street, :city, :zip_code

  def custom_label_method
    "##{id} #{street} #{house_number}#{'/' unless flat_number.blank?}#{flat_number} #{zip_code} #{city}"
  end
end

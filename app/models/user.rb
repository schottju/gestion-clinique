class User < ActiveRecord::Base
  include Gravtastic
  gravtastic default: 'mm', secure: true, rating: 'PG'

  enum role: [:veterinaire, :admin ]

  has_one :address
  has_one :veterinarian
#  has_many :proprios
#  has_many :medical_records
#  has_many :animals
#  has_many :pictures
  accepts_nested_attributes_for :address

  #Rails_admin
  accepts_nested_attributes_for :veterinarian

  validates_presence_of :first_name, :last_name, :phone_number

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  def update_attributes(params)
    if params[:password].blank?
      params.delete :password
      params.delete :password_confirmation
      super params
    end
  end

  def custom_label_method
    "##{id} #{first_name} #{last_name}"
  end

  private

    def self.veterinarian_search(query)
      where("(lower(last_name) like :q OR lower(first_name) like :q) AND role = 0", { q: "%#{query.downcase}%"})
    end
end

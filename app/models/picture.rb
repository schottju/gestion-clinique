class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :proprio
  belongs_to :animal
  has_and_belongs_to_many :medical_records

  validates_presence_of :name, :image

  def custom_label_method
    "##{id} #{name}"
  end

  private

    def self.search(query, proprio_id)
      where("(lower(name) like :q OR lower(description) like :q) AND user_id = :u", { q: "%#{query.downcase}%", u: proprio_id })
    end
end

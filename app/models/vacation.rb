class Vacation < ActiveRecord::Base
  belongs_to :veterinarian

  validates_presence_of :start, :end

  def custom_label_method
    "##{id} Od #{start} do #{self.end}"
  end
end

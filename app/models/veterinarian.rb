class Veterinarian < ActiveRecord::Base
  belongs_to :user
  #  has_and_belongs_to_many :medical_records
#  has_many :proprios
  has_many :medical_records
#  has_many :proprios
  belongs_to :user
  has_many :vacations
  has_one :working_day

  accepts_nested_attributes_for :working_day

  validates_presence_of :title, :pwz

  def custom_label_method
    "##{id} #{title} #{user.try(:decorate).try(:full_name)}, pwz: #{pwz}"
  end

  def next_vacation
    vacation = vacations.where("start >= :d OR \"end\" >= :d", { d: Date.today }).order(:start).first
    vacation.nil? ? '' : "#{vacation.start} - #{vacation.end}"
  end

  def working_today?(date)
    if working_day.nil?
      false
    else
      case date.wday
      when 0
        working_day.sunday?
      when 1
        working_day.monday?
      when 2
        working_day.tuesday?
      when 3
        working_day.wednesday?
      when 4
        working_day.thursday?
      when 5
        working_day.friday?
      when 6
        working_day.saturday?
      end
    end
  end

  def on_vacation?(date)
    if vacations.nil?
      false
    else
      vacations.each do |vacation|
        if vacation.start <= date && vacation.end >= date
          return true
        end
      end

      return false
    end
  end
end

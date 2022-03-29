class Dentist  < ApplicationRecord
  has_many :patients
  validates_presence_of :name, :max_patient_capacity,  :hours, :rating
  validates :accepting_new_patient, inclusion: [true, false]

  def self.order_by_created_at
    self.all.order(created_at: :desc)
  end 

  def nice_date
    self.created_at.strftime("%Y-" "%m-" "%d")
  end

  def patient_count
    self.patients.count
  end

  def patients_sort
    patients.order(:name)
  end

  def patients_above_age(input)
    patients.where("age >#{input}")
  end
end
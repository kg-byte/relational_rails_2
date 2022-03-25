class Dentist  < ApplicationRecord
  has_many :patients
  validates_presence_of :name, :max_patient_capacity,  :hours, :rating
  validates :accepting_new_patient, inclusion: [true, false]

  def self.order_by_created_at
    self.all.order(created_at: :desc)
  end 
end
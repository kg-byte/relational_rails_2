class Patient  < ApplicationRecord
  belongs_to :dentist
  validates_presence_of :name, :age, :insurance_carrier, :referred_by
  validates :referred_by_another_patient, inclusion: [true, false]

end
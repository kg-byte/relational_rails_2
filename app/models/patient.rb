class Patient  < ApplicationRecord
  belongs_to :dentist
  validates_presence_of :name, :age, :insurance_carrier
  validates :referred_by_another_patient, inclusion: [true, false]

  def self.referral_only
    @patients = self.where("referred_by_another_patient = true")
  end

  def self.search_by_partial_name(input)
    where('lower(name) like ?', "%#{input.downcase}%")
  end
end
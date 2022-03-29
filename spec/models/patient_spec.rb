require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :insurance_carrier}
    it {should allow_values(true, false).for(:referred_by_another_patient)}
  end

  describe 'relationships' do
    it {should belong_to :dentist}
  end

  describe 'class methods' do 
    before :each do 
      @dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: 2.1)
      @patient = @dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)
      @patient2 = @dentist.patients.create!(name:"Frank Poore", age: 36, insurance_carrier: 'Cigna Dental', referred_by: 'Angela Morris', referred_by_another_patient:true)
      @patient3 = @dentist.patients.create!(name:"Bill Barthel", age: 26, insurance_carrier: 'XX Dental', referred_by: 'Frank Poore', referred_by_another_patient:true)
   end
    it 'returns referred patients only' do 
      expect(Patient.referral_only).to eq([@patient2, @patient3])
    end


  end

end
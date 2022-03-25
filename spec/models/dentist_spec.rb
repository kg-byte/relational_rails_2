require 'rails_helper'

RSpec.describe Dentist, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :max_patient_capacity}
    it {should validate_presence_of :hours}
    it {should validate_presence_of :rating}
    it {should allow_values(true, false).for(:accepting_new_patient)}
  end

  describe 'relationships' do
    it {should have_many :patients}

  end

  describe 'class methods' do 
    before :each do 
      @dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: 2.1)
      @dentist2 = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, created_at: '2022-03-01', accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)
      @dentist3 = Dentist.create!(name:"Just Dental", max_patient_capacity:5, created_at: '2022-03-03', accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 3.5)
    end 
    it 'sorts dentists by the most recently created' do 
      expect(Dentist.orer_by_created_at).to eq([@dentist, @dentist3, @dentist2])

    end 
  end

end
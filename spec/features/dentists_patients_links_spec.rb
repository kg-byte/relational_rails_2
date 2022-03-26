
require 'rails_helper'

describe 'all index and show pages have links to dentists and patients index page' do 

  it 'has dentists and patients list links' do 
    dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: 2.1)
    patient = dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)

    pages = ["/dentists/#{dentist.id}/patients", "/dentists", "/dentists/#{dentist.id}","/patients", "/patients/#{patient.id}"]
    
    pages.each do |page|
      visit page 

      click_on "All Patients"

      expect(current_path).to eq('/patients')

      click_on "All Dentists"
      
      expect(current_path).to eq('/dentists')
    end 
  end
end
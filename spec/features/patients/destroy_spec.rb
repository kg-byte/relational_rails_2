require 'rails_helper'

RSpec.describe 'destroy a patient' do 


	it 'deletes the patient from the index page' do 
		dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: 2.1)
   	    patient = dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:true)
   	    patient2 =dentist.patients.create!(name:"Frank Poore", age: 36, insurance_carrier: 'Cigna Dental', referred_by: 'Angela Morris', referred_by_another_patient:true)

   		visit "/patients/#{patient.id}"

   		click_button 'Delete'

   		expect(current_path).to eq('/patients')
   		expect(page).to have_content(patient2.insurance_carrier)

	end

end
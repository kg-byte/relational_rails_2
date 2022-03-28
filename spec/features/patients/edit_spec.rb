require 'rails_helper'

RSpec.describe 'the Patient update' do

	it 'links to the edit page' do 
		dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: '2.1')
		patient = dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)
		visit "/patients/#{patient.id}"
		
		click_button 'Edit'		

		expect(current_path).to eq("/patients/#{patient.id}/edit")
	end 

	it 'updates patient' do 
		dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: '2.1')
		patient = dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)

		visit "/patients/#{patient.id}"
		
		expect(page).to have_content('Angela Morris')
		expect(page).to have_content('Delta Dental')

		click_button 'Edit'
		
		fill_in 'Name', with: 'Kim Koala' 
		fill_in 'Age', with: '3'
		fill_in 'Insurance carrier', with: 'Koala Dental'
		fill_in 'Referred by', with: 'N/a'
		fill_in 'Referred by another patient', with: 'false'
		click_button 'Update'

		expect(current_path). to eq("/patients/#{patient.id}")
		expect(page).to have_content('Kim Koala')
		expect(page).to have_content(3)
		expect(page).to have_content('Koala Dental')
		expect(page).to_not have_content('Angela Morris')
		expect(page).to_not have_content(28)
		expect(page).to_not have_content('Delta Dental')



	end
end	
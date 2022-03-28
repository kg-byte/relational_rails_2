require 'rails_helper'

RSpec.describe 'the Dentist Patients creation' do 

	it 'links to the new page from dentist patients index' do 
		 dentist = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)

		visit "/dentists/#{dentist.id}/patients"
		click_on 'New Patient'

		expect(current_path).to eq("/dentists/#{dentist.id}/patients/new")
	end 

	it 'creates new patient' do 
		dentist = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)
		
		visit "/dentists/#{dentist.id}/patients/new"
		
		fill_in 'Name', with: 'Kim Koala' 
		fill_in 'Age', with: '3'
		fill_in 'Insurance carrier', with: 'Koala Dental'
		fill_in 'Referred by', with: 'N/a'
		fill_in 'Referred by another patient', with: 'false'
		click_button('Create Patient')

		save_and_open_page
		expect(current_path).to eq("/dentists/#{dentist.id}/patients")
		expect(page).to have_content('Kim Koala')
	end

end 
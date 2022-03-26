require 'rails_helper'

RSpec.describe 'the Dentist update' do

	it 'links to the edit page' do 
		dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: '2.1')
		
		visit "/dentists/#{dentist.id}"
		
		click_button 'Edit'		

		expect(current_path).to eq("/dentists/#{dentist.id}/edit")
	end 

	it 'updates dentist' do 
		dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: '2.1')
		
		visit "/dentists/#{dentist.id}"
		
		expect(page).to have_content('Discomfort Dental')
		expect(page).to have_content('M-F, 9am - 6pm')

		click_button 'Edit'
		
		fill_in 'Name', with: 'Comfortish Dental'
		fill_in'max_patient_capacity', with: '1'
		fill_in 'accepting_new_patient', with: 'false'
		fill_in 'Hours', with: 'M-S, 10am - 5pm'
		fill_in 'Rating', with: '2.3'
		click_button 'Update'

		expect(current_path). to eq("/dentists/#{dentist.id}")
		expect(page).to have_content('Comfortish Dental')
		expect(page).to have_content('M-S, 10am - 5pm')
		expect(page).to_not have_content('Discomfort Dental')
		expect(page).to_not have_content('M-F, 9am - 6pm')
	end
end	
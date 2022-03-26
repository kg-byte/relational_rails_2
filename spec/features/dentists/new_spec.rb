require 'rails_helper'

RSpec.describe 'the Dentist creation' do 

	it 'links to the new page from dentists index' do 
		visit '/dentists'
		click_on 'New Dentist'

		expect(current_path).to eq('/dentists/new')
	end 

	xit 'creates new dentist' do 
		visit '/dentists/new'

		fill_in('Name', with: 'New Dental')
		fill_in 'max_patient_capacity', with: '10'
		fill_in 'accepting_new_patient', with: 'true'
		fill_in('Hours', with: 'M-F, 9am-6pm')
		fill_in('Rating', with: '5.0')
		click_button('Create Dentist')


		expect(current_path).to eq('/dentists')
		expect(page).to have_content('New Dental')
	end

end 
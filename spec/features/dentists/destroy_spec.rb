require 'rails_helper'

RSpec.describe 'destroy a dentist' do 


	it 'deletes the dentist from the index page' do 
		dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: 2.1)
   		dentist2 = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, created_at: '2022-03-01', accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)

   		visit "/dentists/#{dentist.id}"

   		click_button 'Delete'

   		expect(current_path).to eq('/dentists')
   		expect(page).to_not have_content(dentist.name)
   		expect(page).to have_content(dentist2.name)

	end

end
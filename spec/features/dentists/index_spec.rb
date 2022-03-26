require 'rails_helper'


RSpec.describe 'dentist index page' do
  before :each do 
    @dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: 2.1)
    @dentist2 = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, created_at: '2022-03-01', accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)
    @dentist3 = Dentist.create!(name:"Just Dental", max_patient_capacity:5, created_at: '2022-03-03', accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 3.5)
  end

  it 'displays dentist information' do
    visit "/dentists"

    expect(page).to have_content(@dentist.name)
    expect(page).to have_content(@dentist2.name)
    expect(page).to have_content(@dentist3.name)
  end

  it 'displays dentists by most recently created' do 
    visit "/dentists"
    save_and_open_page
    expect(@dentist.name).to appear_before(@dentist3.name)
    expect(@dentist3.name).to appear_before(@dentist2.name)
    expect(page).to have_content(@dentist.nice_date)
    expect(page).to have_content(@dentist2.nice_date)
    expect(page).to have_content(@dentist3.nice_date)
  end 
end 
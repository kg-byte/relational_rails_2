require 'rails_helper'

RSpec.describe 'dentist index page' do
   before :each do 
    @dentist = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: 2.1)
    @dentist2 = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, created_at: '2022-03-01', accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)
    @dentist3 = Dentist.create!(name:"Just Dental", max_patient_capacity:5, created_at: '2022-03-03', accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 3.5)
    @patient = @dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)
    @patient2 = @dentist.patients.create!(name:"Frank Poore", age: 36, insurance_carrier: 'Cigna Dental', referred_by: 'Angela Morris', referred_by_another_patient:true)
    @patient3 = @dentist.patients.create!(name:"Bill Barthel", age: 26, insurance_carrier: 'XX Dental', referred_by: 'Frank Poore', referred_by_another_patient:true)
  end

  it 'displays dentist information' do
  
    visit "/dentists/#{@dentist.id}"
    
    expect(page).to have_content(@dentist.name)
    expect(page).to have_content(@dentist.created_at)
    expect(page).to have_content(@dentist.updated_at)
    expect(page).to have_content(@dentist.max_patient_capacity)
    expect(page).to have_content(@dentist.accepting_new_patient)
    expect(page).to have_content(@dentist.hours)
    expect(page).to have_content(@dentist.rating)

    expect(page).to_not have_content(@dentist2.name)
    expect(page).to_not have_content(@dentist3.rating)

    visit "/dentists/#{@dentist2.id}"
    
    expect(page).to have_content(@dentist2.name)
    expect(page).to have_content(@dentist2.created_at)
    expect(page).to have_content(@dentist2.updated_at)
    expect(page).to have_content(@dentist2.max_patient_capacity)
    expect(page).to have_content(@dentist2.accepting_new_patient)
    expect(page).to have_content(@dentist2.hours)
    expect(page).to have_content(@dentist2.rating)

    
    expect(page).to_not have_content(@dentist3.name)
    expect(page).to_not have_content(@dentist.rating)
  save_and_open_page
  end


end 
require 'rails_helper'

RSpec.describe 'patient index page' do
  before :each do 
    @dentist = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)
    @patient = @dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:true)
    @patient2 =@dentist.patients.create!(name:"Frank Poore", age: 36, insurance_carrier: 'Cigna Dental', referred_by: 'Angela Morris', referred_by_another_patient:true)
  end
  it 'displays patient information' do    
    visit "/patients"
    
    expect(page).to have_content(@patient.name)
    expect(page).to have_content(@patient.age)
    expect(page).to have_content(@patient.insurance_carrier)
    expect(page).to have_content(@patient.referred_by)
    expect(page).to have_content(@patient.referred_by_another_patient)
    expect(page).to have_content(@patient.dentist_id)
    expect(page).to have_content(@patient2.name)
    expect(page).to have_content(@patient2.age)
    expect(page).to have_content(@patient2.insurance_carrier)
    expect(page).to have_content(@patient2.referred_by)
    expect(page).to have_content(@patient2.referred_by_another_patient)
    expect(page).to have_content(@patient2.dentist_id)
  end

  it 'only displays patients referred by another patient' do 
    patient3 =@dentist.patients.create!(name:"Kim Koala", age: 3, insurance_carrier: 'Koala Dental', referred_by: 'N/a', referred_by_another_patient:false)

    visit "/patients"

    expect(page).to have_content(@patient.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to_not have_content(patient3.name)
  
  end



  it 'has a link next to each patient to edit it' do 
    visit "/patients"
    click_on "Edit #{@patient.name}"

    expect(current_path).to eq("/patients/#{@patient.id}/edit") 

    visit "/patients"
    click_on "Edit #{@patient2.name}"

    expect(current_path).to eq("/patients/#{@patient2.id}/edit")
  end

  it 'has a link to delete a patient' do 
    visit '/patients'
    click_on "Delete #{@patient.name}"

    expect(current_path).to eq('/patients')
    expect(page).to have_content(@patient2.name)
    expect(page).to_not have_content(@patient.insurance_carrier)

    click_on "Delete #{@patient2.name}"

    expect(current_path).to eq('/patients')
    expect(page).to_not have_content(@patient2.name)
    expect(page).to_not have_content(@patient.name)
  end 


  it 'searches by partial name' do 
    visit '/patients'
    fill_in 'Search by partial name', with: 'Frank'

    click_on "Submit"

    expect(current_path).to eq ('/patients')
    expect(page).to have_content(@patient2.name)
    expect(page).to_not have_content(@patient.insurance_carrier)
  end

end
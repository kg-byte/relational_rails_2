require 'rails_helper'

RSpec.describe 'patient index page' do
  before :each do 
    @dentist = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)
    @patient1 =@dentist.patients.create!(name:"Frank Poore", age: 36, insurance_carrier: 'Cigna Dental', referred_by: 'Angela Morris', referred_by_another_patient:true)
    @patient2 = @dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)
    @patient3 =@dentist.patients.create!(name:"Kim Koala", age: 3, insurance_carrier: 'Koala Dental', referred_by: 'N/a', referred_by_another_patient:false)

    visit "/patients"  end
  it 'displays patient information' do    
    visit "/dentists/#{@dentist.id}/patients"
    
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient1.age)
    expect(page).to have_content(@patient1.insurance_carrier)
    expect(page).to have_content(@patient1.referred_by)
    expect(page).to have_content(@patient1.referred_by_another_patient)
    expect(page).to have_content(@patient1.dentist_id)

    expect(page).to have_content(@patient2.name)
    expect(page).to have_content(@patient2.age)
    expect(page).to have_content(@patient2.insurance_carrier)
    expect(page).to have_content(@patient2.referred_by)
    expect(page).to have_content(@patient2.referred_by_another_patient)
    expect(page).to have_content(@patient2.dentist_id)
  end


  it 'has a link that sorts children alphabetically' do 
    visit "/dentists/#{@dentist.id}/patients"

    click_on "Show Patients in Alphabetical Order"

    expect(current_path).to eq ("/dentists/#{@dentist.id}/patients")
    expect(@patient2.name).to appear_before(@patient1.name)
    expect(@patient1.name).to appear_before(@patient3.name)

  end 

  it 'has a link next to each patient to edit it' do 

    visit "/dentists/#{@dentist.id}/patients"
    within("#Patient-#{@patient1.id}") do
      click_on "Edit"
      expect(current_path).to eq("/patients/#{@patient1.id}/edit") 
    end
    
    visit "/dentists/#{@dentist.id}/patients"
    within("#Patient-#{@patient2.id}") do
      click_on "Edit"
      expect(current_path).to eq("/patients/#{@patient2.id}/edit")
    end
  end



    it 'display records over a given threshold' do 

    visit "/dentists/#{@dentist.id}/patients"

    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to have_content(@patient3.name)
    
    fill_in 'Show patients older than', with: 18
    click_on 'Submit'
    
    expect(current_path).to eq("/dentists/#{@dentist.id}/patients")

    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to_not have_content(@patient3.name)

  end 



end
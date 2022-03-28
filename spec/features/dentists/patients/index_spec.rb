require 'rails_helper'

RSpec.describe 'patient index page' do
  before :each do 
    @dentist = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)
    @patient = @dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)
    @patient2 =@dentist.patients.create!(name:"Frank Poore", age: 36, insurance_carrier: 'Cigna Dental', referred_by: 'Angela Morris', referred_by_another_patient:true)
  end
  it 'displays patient information' do    
    visit "/dentists/#{@dentist.id}/patients"
    
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


  it ''

end
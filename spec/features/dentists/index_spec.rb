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

    expect(@dentist.name).to appear_before(@dentist3.name)
    expect(@dentist3.name).to appear_before(@dentist2.name)
    
    expect_1 = "Created on: #{@dentist.nice_date}"
    expect_2 = "Created on: #{@dentist2.nice_date}"
    expect_3 = "Created on: #{@dentist3.nice_date}"
  
    expect(page).to have_content(expect_1)
    expect(page).to have_content(expect_2)
    expect(page).to have_content(expect_3)
  end 

  it 'has link to edit and update each parent' do 
    visit '/dentists'
    click_on "Edit #{@dentist.name}"

    expect(current_path).to eq ("/dentists/#{@dentist.id}/edit")

    visit '/dentists'
    click_on "Edit #{@dentist3.name}"

    expect(current_path).to eq ("/dentists/#{@dentist3.id}/edit")

    visit '/dentists'
    click_on "Edit #{@dentist2.name}"

    expect(current_path).to eq ("/dentists/#{@dentist2.id}/edit")
  end

  it 'has link to delete each dentist' do 
    visit '/dentists'
    click_on "Delete #{@dentist.name}"

    expect(current_path).to eq ("/dentists")
    expect(page).to have_content(@dentist2.name)
    expect(page).to have_content(@dentist3.name)
    expect(page).to_not have_content(@dentist.name)

 
    click_on "Delete #{@dentist2.name}"

    expect(current_path).to eq ("/dentists")
    expect(page).to have_content(@dentist3.name)
    expect(page).to_not have_content(@dentist.name)
    expect(page).to_not have_content(@dentist2.name)

   
    click_on "Delete #{@dentist3.name}"

    expect(current_path).to eq ("/dentists")
    expect(page).to_not have_content(@dentist2.name)
    expect(page).to_not have_content(@dentist3.name)
    expect(page).to_not have_content(@dentist.name)

  end 

  it 'sorts dentists by number of patients' do 
    @dentist.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)
    @dentist.patients.create!(name:"Frank Poore", age: 36, insurance_carrier: 'Cigna Dental', referred_by: 'Angela Morris', referred_by_another_patient:true)
    @dentist.patients.create!(name:"Bill Barthel", age: 26, insurance_carrier: 'XX Dental', referred_by: 'Frank Poore', referred_by_another_patient:true)
    @dentist2.patients.create!(name: "Koala 1", age:2, insurance_carrier: 'Koala 1 Dental', referred_by: 'NA', referred_by_another_patient: false)
    @dentist2.patients.create!(name: "Koala 2", age:3, insurance_carrier: 'Koala 2 Dental', referred_by: 'NA', referred_by_another_patient: false)
  
    visit '/dentists'
    click_on "Show Dentists by Number of Patients"

    expect(current_path).to eq('/dentists')
    expect(@dentist.name).to appear_before(@dentist2.name)
    expect(@dentist2.name).to appear_before(@dentist3.name)

  end

end 
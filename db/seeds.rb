# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	Dentist.destroy_all 
    Patient.destroy_all

    @dentist1 = Dentist.create!(name:"Discomfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 6pm', rating: 2.1)
    @dentist1.patients.create!(name:"Angela Morris", age: 28, insurance_carrier: 'Delta Dental', referred_by: 'NA', referred_by_another_patient:false)
    @dentist1.patients.create!(name:"Frank Poore", age: 36, insurance_carrier: 'Cigna Dental', referred_by: 'Angela Morris', referred_by_another_patient:true)
    @dentist1.patients.create!(name:"Bill Barthel", age: 26, insurance_carrier: 'XX Dental', referred_by: 'Frank Poore', referred_by_another_patient:true)

    @dentist2 = Dentist.create!(name:"Comfort Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 4.1)
    @dentist2.patients.create!(name: "Koala 1", age:2, insurance_carrier: 'Koala 1 Dental', referred_by: 'NA', referred_by_another_patient: false)
    @dentist2.patients.create!(name: "Koala 2", age:3, insurance_carrier: 'Koala 2 Dental', referred_by: 'NA', referred_by_another_patient: false)
    @dentist2.patients.create!(name: "Koala 3", age:1, insurance_carrier: 'Koala 3 Dental', referred_by: 'NA', referred_by_another_patient: false)

    @dentist3 = Dentist.create!(name:"Just Dental", max_patient_capacity:5, accepting_new_patient: true, hours: 'M-F, 9am - 7pm', rating: 3.5)
    @dentist2.patients.create!(name: "Capybara 1", age:2, insurance_carrier: 'Capybara 1 Dental', referred_by: 'NA', referred_by_another_patient: false)
    @dentist2.patients.create!(name: "Capybara 2", age:3, insurance_carrier: 'Capybara 2 Dental', referred_by: 'NA', referred_by_another_patient: false)
    @dentist2.patients.create!(name: "Capybara 3", age:1, insurance_carrier: 'Capybara 3 Dental', referred_by: 'NA', referred_by_another_patient: false)
    
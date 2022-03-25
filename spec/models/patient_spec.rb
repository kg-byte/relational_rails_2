require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :insurance_carrier}
    it {should validate_presence_of :referred_by}
    it {should allow_values(true, false).for(:referred_by_another_patient)}
  end

  describe 'relationships' do
    it {should belong_to :dentist}
  end

end
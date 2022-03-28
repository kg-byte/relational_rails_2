
class DentistPatientsController < ApplicationController
  def index
    @dentist = Dentist.find(params[:dentist_id])
    @patients = @dentist.patients
  end


end

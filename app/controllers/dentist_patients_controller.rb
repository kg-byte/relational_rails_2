
class DentistPatientsController < ApplicationController
  def index
    @dentist = Dentist.find(params[:dentist_id])
    if params[:order] == "alpha"
      @patients = @dentist.patients_sort
    else 
      @patients = @dentist.patients
    end
  end

end


class DentistPatientsController < ApplicationController
  def index
    @dentist = Dentist.find(params[:dentist_id])
    if params[:order] == "alpha"
      @patients = @dentist.patients_sort
    elsif params[:show_patients_older_than] != nil 
      @patients = @dentist.patients_above_age(params[:show_patients_older_than])
    else 
      @patients = @dentist.patients
    end
  end

end

class DentistsController < ApplicationController
  def index
    if params[:order] == "patients_number"
      @dentists = Dentist.order_by_patients
    else 
      @dentists = Dentist.order_by_created_at
    end
  end

  def show
    @dentist = Dentist.find(params[:id])
    @patient_count = @dentist.patient_count
  end 

  def new
  end

  def create
    Dentist.create(dentist_params)
    redirect_to '/dentists'
  end

  def edit
    @dentist = Dentist.find(params[:id])
  end

  def update
    dentist = Dentist.find(params[:id])
    dentist.update(dentist_params)
    redirect_to "/dentists/#{dentist.id}"
  end


  def destroy
    dentist = Dentist.find(params[:id])
    dentist.patients.destroy_all
    dentist.destroy
    redirect_to "/dentists"
  end

private

  def dentist_params
    params.permit(:name, :max_patient_capacity, :accepting_new_patient, :hours, :rating)
  end

end 
class DentistsController < ApplicationController
  def index
    @dentists = Dentist.order_by_created_at
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



private

  def dentist_params
    params.permit(:name, :max_patient_capacity, :accepting_new_patient, :hours, :rating)
  end

end 
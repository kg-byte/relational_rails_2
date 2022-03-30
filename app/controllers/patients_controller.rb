class PatientsController < ApplicationController

	def index
    if params[:search_by_partial_name] 
      @patients = Patient.search_by_partial_name(params[:search_by_partial_name])
    else 
		  @patients = Patient.referral_only
    end
	end

	def show 
		@patient = Patient.find(params[:id])
	end 

	def new
		@dentist = Dentist.find(params[:dentist_id])
		@patient = Patient.new
	end 

  def create
  	@dentist = Dentist.find(params[:dentist_id])
    @patient = @dentist.patients.create(patient_params)
    redirect_to "/dentists/#{@dentist.id}/patients"
  end

  def edit 
  	@patient = Patient.find(params[:id])
  end 


  def update
  	patient = Patient.find(params[:id])
  	patient.update(patient_params)
  	redirect_to "/patients/#{patient.id}"
  end 
  

  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    redirect_to "/patients"
  end 

  private 

  def patient_params
    params.require(:patient).permit(:name, :age, :insurance_carrier, :referred_by, :referred_by_another_patient)
  end 
end 
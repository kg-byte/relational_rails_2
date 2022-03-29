class PatientsController < ApplicationController

	def index
		@patients = Patient.referral_only
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

    # @patient= @dentist.patients.create!(name: params_patient[:name],
    # 																	 age: params_patient[:age],
    # 																	 insurance_carrier: params_patient[:insurance_carrier],
    # 																	 referred_by: params_patient[:referred_by],
    # 																	 referred_by_another_patient: params_patient[:referred_by_another_patient])
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
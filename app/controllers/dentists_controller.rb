class DentistsController < ApplicationController
  def index
    @dentists = Dentist.orer_by_created_at
  end

end 
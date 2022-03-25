class DentistsController < ApplicationController
  def index
    @dentists = Dentist.order_by_created_at
  end

  def show
    @dentist = Dentist.find(params[:id])
  end 
end 
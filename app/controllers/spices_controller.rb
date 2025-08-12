class SpicesController < ApplicationController
  def index 
    spices = Spice.all 
    render json: spices, except: [:created_at, :updated_at]
  end

  def create 
    new_spice = Spice.create(spice_params)
    render json: new_spice, status: :created 
  end

  private 

  def spice_params 
    params.permit(:title, :image, :description, :notes, :rating)
  end
end

class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
  def index 
    spices = Spice.all 
    render json: spices, except: [:created_at, :updated_at]
  end

  def create 
    new_spice = Spice.create(spice_params)
    render json: new_spice, status: :created 
  end

  def update 
    spice = Spice.find(params[:id])
    spice.update(spice_params)
    render json: spice 
  end

  def destroy 
    spice = Spice.find(params[:id])
    spice.destroy 
    head :no_content 
  end

  private 

  def spice_params 
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_not_found 
    render json: { error: "Spice not found" }, status: :not_found
  end
end

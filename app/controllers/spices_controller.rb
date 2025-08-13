class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    spices = Spice.all
    render json: spices
  end

  def show
    spice = find_spices
    render json: spice
  end

  def create 
    spice = Spice.create(spice_params)
    render json: spice
  end

  def update
    spice = find_spices
    spice.update(spice_params)
    render json: spice
  end

  def destroy
    spice = find_spices
    spice.destroy
    head :no_content
  end

  private

  def find_spices
    Spice.find_by(id: params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_not_found_response
    render json: { error: "Spice not found" }, status: not_found
  end


end

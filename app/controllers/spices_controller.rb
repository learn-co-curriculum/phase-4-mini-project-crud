class SpicesController < ApplicationController

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
end

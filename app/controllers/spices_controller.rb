class SpicesController < ApplicationController
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def index
    spices = Spice.all
    render json: spices
  end

  def show
    spice = find_spice_by_id
    render json: spice
  end

  def create
    spice = Spice.create(spices_parameters)
    render json: spice, status: 201
  end

  def update
    spice = find_spice_by_id
    spice.update(spices_parameters)
    render json: spice, status: 201
  end

  def destroy
    spice = find_spice_by_id
    spice.destroy
    head :no_content
  end

  private

  def find_spice_by_id
    Spice.find(params[:id])
  end

  def render_record_not_found
    render json: { error: "Record not found" }, status: :not_found
  end

  def spices_parameters
    params.permit(:title, :description, :notes, :rating, :image)
  end
end

class SpicesController < ApplicationController

  def index
    spices = Spice.all
    render json: spices
  end

  def show
    spice = Spice.find_by(id: params[:id])
    render json: spice
  end
end

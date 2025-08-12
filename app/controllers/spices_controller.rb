class SpicesController < ApplicationController
  def index 
    spices = Spice.all 
    render json: spices
  end
end

class SpicesController < ApplicationController

    # GET spices
    def index
        spices = Spice.all
        render json: spices
    end

    # # GET spice
    # def show
    #     spice = find_spice_by_id
    #     if spice
    #         render json: spice
    #     else
    #         display_not_found_error
    #     end
    # end

    # POST spice
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # PATCH spice
    def update
        spice = find_spice_by_id
        if spice
            spice.update(spice_params)
            render json: spice
        else
            display_not_found_error
        end
    end

    # DELETE spice
    def destroy
        spice = find_spice_by_id
        if spice
            spice.destroy
            head :no_content
        else
            display_not_found_error
        end
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def display_not_found_error
        render json: {error: "Spice not found"}, status: :not_found
    end

    def find_spice_by_id
        Spice.find_by(id: params[:id])
    end

end

class BandsController < ApplicationController

    def index
        
    end

    def show

    end

    def new
        @band = Band.new
        render :new
    end

    def create

    end

    def update

    end

    def destroy

    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end

class ClimbingRoutesController < ApplicationController

    skip_before_action :authorized, only: [:index, :create]

    def index
        @routes = ClimbingRoute.all
        render json: ClimbingRouteSerializer.new(@routes)
    end

    def create
        @route = ClimbingRoute.new(climbing_route_params)
      
        if @route.valid?
            @route.save
            render json: @route
        else
            render json: {message: @route.errors.messages}
        end
    end
    
    private

    def climbing_route_params
        params.require(:climbing_route).permit(:name, :style, :difficulty, :pitches, :location, :url)
    end

end

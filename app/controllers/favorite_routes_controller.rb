class FavoriteRoutesController < ApplicationController

    def index
        @favorite_routes = FavoriteRoute.all
        render json: FavoriteRouteSerializer.new(@favorite_routes)
    end

    def create
        @favorite_route = FavoriteRoute.new(favorite_route_params)
        
        if @favorite_route.valid?
            @favorite_route.save
            render json: @favorite_route
        else
            render json: { errors: @favorite_route.errors.messages}
        end
    end

    private

    def favorite_route_params
        params.require(:favorite_route).permit(:user_id, :climbing_route_id)
    end
end

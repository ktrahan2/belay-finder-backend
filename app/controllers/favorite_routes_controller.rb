class FavoriteRoutesController < ApplicationController

    skip_before_action :authorized, only: [:index, :show]

    def index
        @favorite_routes = FavoriteRoute.all
        render json: FavoriteRouteSerializer.new(@favorite_routes)
    end

    def show
        @favorite_route = FavoriteRoute.find(params[:id])
        render json: FavoriteRouteSerializer.new(@favorite_route)
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

    def destroy
        @favorite_route = FavoriteRoute.find(params[:id])
        @favorite_route.destroy

        render json: {message: `#{@favorite_route} deleted`}
    end


    private

    def favorite_route_params
        params.require(:favorite_route).permit(:user_id, :climbing_route_id)
    end
end

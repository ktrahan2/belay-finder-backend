class PartnershipsController < ApplicationController

    skip_before_action :authorized, only: [:index, :show]
    def index
        @partnerships = Partnership.all
        render json: PartnershipSerializer.new(@partnerships)
    end

    def show
        @partnership = Partnership.find(params[:id])
        render json: PartnershipSerializer.new(@partnership)
    end

    def create
        @partnership = Partnership.new(partnership_params)

        if @partnership.valid?
            @partnership.save
            render json: @partnership
        else
            render json: { errors: @partnership.errors.messages }
        end
    end

    def destroy
        @partnership = Partnership.find(params[:id])
        @partnership.destroy
        
        render json: { messages: "Belay request canceled" }
    end

    private

    def partnership_params
        params.require(:partnership).permit(:requestor_id, :receiver_id, :partnership_status)
    end

end

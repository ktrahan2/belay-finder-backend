class PartnershipsController < ApplicationController

    def index
        @partnerships = Partnership.all
        render json: PartnershipSerializer.new(@partnerships)
    end

    def create
        @partnership = Partnership.new(partnership_params)

        if @partnership.valid?
            @partnership.save
            render json: @partnership
        else
            render json: { errors: @partnership.errors.messages}
        end
    end

    private

    def partnership_params
        params.require(:partnership).permit(:requestor_id, :receiver_id, :partnership_status)
    end

end

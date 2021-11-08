class LeasesController < ApplicationController
rescue_from ActiveRecord::InvalidRecord, with: :render_not_found_response

    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
    end

    private

    def render_not_found_response(invalid)
        render json: { error: invalid.errors.full_messages }, status: :not_found
    end

    def lease_params
        params.permit(:rent)
    end
end

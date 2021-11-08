class TenantsController < ApplicationController
    rescue_from ActiveRecord::InvalidRecord, with: :render_not_found_response

    # /tenants
    def index
        render json: Tenant.all, status: :ok
    end

    # /tenants/:id
    def show
        tenant = find_tenant
        render json: tenant, status: :ok
    end

    # /tenants/:id
    def update
        tenant = find_tenant
        tenant.update(tenant_params)
        render json: tenant, status: :accepted
    end

    # /tenants/:id
    def destroy
        tenant = find_tenant
        tenant.destroy
    end

    private

    def find_tenant
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Tenant not found" }, status: :not_found
    end

end
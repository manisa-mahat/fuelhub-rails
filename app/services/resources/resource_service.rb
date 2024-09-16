module Resources
  class ResourceService
    attr_reader :params, :user
    attr_accessor :resource

    def initialize(params = {})
      @params = params
      @user = user
    end


    def perform_create_resource
      create_resource
    end

    def execute_delete_resource
      delete_resource
    end

    def execute_update_resource
      update_resource
    end

    private

    def create_resource
      @resource = Resource.new(resource_params.merge(user_id: current_user.id))
      if @resource.save!
        success_response(@resource)
      else
        error_response(@resource.errors.full_messages)
      end
    rescue ActiveRecord::RecordInvalid => e
      error_response([ e.message ])
    end

    def delete_resource
      @resource = find_resource
      # authorize_admin!
      if @resource.destroy
        success_response(@resource)
      else
        error_response(resource.errors.full_messages)
      end
    end

    def update_resource
      @resource = find_resource
      # authorize_admin!
      if @resource.update(resource_params)
        success_response(@resource)
      else
        error_response(resource.errors.full_messages)
      end
    end

    def current_user
      current_user ||= params[:current_user]
    end

    # def authorize_admin!
    # raise StandardError.new("Unauthorized") unless user.admin?
    # end

    def find_resource
      Resource.find_by!(id: params[:id])
    end

    def resource_params
      ActionController::Parameters.new(params).permit(:resource_category, :resource_status, :tenant_id)
    end

    def success_response(resource)
      OpenStruct.new(success: true, resource: @resource, errors: [])
    end

    def error_response(errors)
      OpenStruct.new(success: false, resource: nil, errors: errors)
    end
  end
end

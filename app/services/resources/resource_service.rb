module Resources
  class ResourceService
    attr_reader :params, :user
    attr_accessor :resource, :resources

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

    def execute_get_resources
      get_resources
    end

    private

    def create_resource
      if current_user.present?
        @resource = Resource.new(resource_params.merge(user_id: current_user.id, tenant_id: current_user.tenant_id))
        if @resource.save!
          success_response(@resource)
        else
          error_response(@resource.errors.full_messages)
        end
      else
        error_response([ "User not authenticated" ])
      end
    rescue ActiveRecord::RecordNotFound => e
      error_response([ e.message ])
    rescue ActiveRecord::RecordInvalid => e
      error_response([ e.message ])
    rescue StandardError => e
      error_response([ e.message ])
    end

    def delete_resource
      @resource = find_resource
      if current_user.present?
        if @resource.destroy
          success_response(@resource)
        else
          error_response(@resource.errors.full_messages)
        end
      else
        error_response([ "User not authenticated" ])
      end
    rescue ActiveRecord::RecordNotFound => e
      error_response([ e.message ])
    rescue ActiveRecord::RecordInvalid => e
      error_response([ e.message ])
    rescue StandardError => e
      error_response([ e.message ])
    end



    def update_resource
      @resource = find_resource
      if current_user.present?
        if @resource.update(resource_params)
          success_response(@resource)
        else
          error_response(resource.errors.full_messages)
        end
      else
        error_response([ "User not authenticated" ])
      end
    rescue ActiveRecord::RecordNotFound => e
      error_response([ e.message ])
    rescue ActiveRecord::RecordInvalid => e
      error_response([ e.message ])
    rescue StandardError => e
      error_response([ e.message ])
    end

    def get_resources
      begin
        @resources = Resource.where(tenant_id: current_user.tenant_id).order(created_at: :DESC)
        success_response(@resources)
      rescue ActiveRecord::RecordNotFound => e
        error_response([ e.message ])
      rescue StandardError => e
        error_response([ e.message ])
      end
    end


    def current_user
      current_user ||= params[:current_user]
    end


    def find_resource
      Resource.find_by!(id: params[:id])
    end

    def resource_params
      ActionController::Parameters.new(params).permit(:resource_category, :resource_status)
    end

    def success_response(resource)
      OpenStruct.new(success: true, resource: @resource, errors: [])
    end

    def error_response(errors)
      OpenStruct.new(success: false, resource: nil, errors: errors)
    end
  end
end

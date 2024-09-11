module Drivers
  class DriverServices
    attr_reader :params, :user
    attr_accessor :driver

    def initialize (params = {})
      @params = params
      @user = params[:current_user] # extracts current user frrom params and assigns it to @user
    end

    def perform_create_driver
      create_driver           # initiates the driver creation process by calling the private create_driver method.
    end

    def execute_update_driver  # initiates the driver update process by calling the private update_driver method.
      update_driver
    end

    def execute_delete_driver  # initiates the driver deletion process by calling the private delete_driver method.
      delete_driver
    end

    private

    def create_driver
      begin
      @driver = Driver.new(driver_params.merge(user_id: current_user.id))
      if @driver.save
        success_response(@driver)
      else
        error_response(@driver.errors.full_messages)
      end
      rescue ActiveRecord::RecordInvalid => e
      error_response([ e.message ])
      end
    end

    def update_driver
      begin
      @driver = find_driver
      if @driver.update(driver_params)
        success_response(@driver)
      else
        error_response(@driver.errors.full_messages)
      end
      rescue ActiveRecord::RecordNotFound => e
      error_response([ e.message ])
      end
    end

    def delete_driver
      begin
      @driver = find_driver
      if @driver.destroy
        success_response(@driver)
      else
        error_response(@driver.errors.full_messages)
      end
      rescue ActiveRecord::RecordNotFound => e
      error_response([ e.message ])
      end
    end

    def current_user
      @current_user ||= params[:current_user]
    end

    def find_driver
      Driver.find(params[:id])
    end

    def driver_params
      params.permit(:name, :phone, :email, :status, :tenant_id)
    end

    def success_response(driver)
      OpenStruct.new(success: true, driver: driver, errors: [])
    end

    def error_response(errors)
      OpenStruct.new(success: false, driver: nil, errors: errors)
    end
  end
end

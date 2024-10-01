module Outlets
  class ConsumerOutletService
    attr_reader :params
    attr_accessor :success, :errors, :outlet, :outlets

    def initialize(params = {})
      @params = params
      @success = false
      @errors = []
    end

    def create_consumer_outlet
      create_outlets
      self
    end

    def success?
      @success
    end

    def execute_get_outlet
      get_outlets
      self
    end

    def delete_consumer_outlet
      destroy_outlets
      self
    end

    def update_consumer_outlet
      update_outlets
      self
    end

    private

    def create_outlets
      @errors = []
      ActsAsTenant.with_tenant(current_user.tenant) do
        consumer = Consumer.find_by(id: params[:consumer_id])
        if consumer
          @outlet = ConsumerOutlet.new(consumer_outlet_params.merge(user_id: current_user.id))

          if @outlet.save
            @success = true
          else
            @success = false
            @errors = @outlet.errors.full_messages
          end
        else
          @success = false
          @errors << "Consumer not found"
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      @success = false
      @errors << "Consumer not found: #{e.message}"
    rescue ActiveRecord::ActiveRecordError => e
      @success = false
      @errors << "Database error: #{e.message}"
    rescue StandardError => e
      @success = false
      @errors << "An error occurred: #{e.message}"
    end

    def get_outlets
      consumer = Consumer.find_by(id: params[:id])
      if consumer
        @outlets = consumer.consumer_outlets.where(tenant_id: current_user.tenant_id)
        @success = true
        @errors = []
      else
        @success = false
        @errors << "Consumer not found"
      end
    rescue StandardError => e
      @success = false
      @errors << "An error occurred: #{e.message}"
    end

    def destroy_outlets
      consumer_outlet = ConsumerOutlet.find_by(id: params[:id])
      if consumer_outlet && consumer_outlet.destroy
        @outlet = consumer_outlet
        @success = true
        @errors = []
      else
        @success = false
        @errors << "Outlet not found or could not be deleted."
      end
    rescue StandardError => e
      @success = false
      @errors << "An error occurred: #{e.message}"
    end

    def update_outlets
      begin
        # debugger
        consumer_outlet = ConsumerOutlet.find(params[:id])
        if consumer_outlet.present?
          consumer_outlet.update!(consumer_outlet_params)
          @outlet = consumer_outlet
          @success = true
          @errors = []
        else
          @success = false
          @errors = @outlet
        end
      rescue ActiveRecord::ActiveRecordError => error
        @success = true
        @errors = [ error.message ]
      end
    end
    def consumer_outlet_params
      ActionController::Parameters.new(params).permit(:name, :address, :consumer_id)
    end

    def current_user
      params[:current_user]
    end
  end
end

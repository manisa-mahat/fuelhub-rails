module Consumers
  class ConsumerService
    attr_reader :params
    attr_accessor :success, :errors, :consumer, :consumers

    def initialize(params = {})
    @params = params
    @success = false
    @errors = []
    end

    def execute_create_consumer
      create_consumer
      self
    end

    def execute_update_consumer
      update_consumer
      self
    end

    def execute_delete_consumer
      delete_consumer
      self
    end

    def success?
      @success
    end

    private

    def create_consumer
      begin
        tenant = Tenant.find(params[:tenant_id])
        if tenant.present?
          @consumer = Consumer.create!(consumer_params)
          @success = true
          @errors = []
        else
          @success = false
          @errors << "Tenant not found"
        end
      rescue ActiveRecord::ActiveRecordError => error
        @success =false
        @errors << error.message
      end
    end

    def update_consumer
      begin

        @consumer = Consumer.find(params[:id])
        if @consumer.present?
          @consumer.update!(consumer_params)
          @consumer = consumer
          @success = true
          @errors = []
        else
          @success = false
          @errors << "Consumer not found"
        end
      rescue ActiveRecord::ActiveRecordError => error
        @success = false
        @errors << error.message
      end
    end

    def delete_consumer
      begin
        @consumer = Consumer.find_by(id: params[:id])
        if @consumer.present?
          @consumer.destroy!
          @success = true
          @errors = []
        else
          @success = false
          @errors << "Consumer not found"
        end
      rescue ActiveRecord::ActiveRecordError => error
        @success = false
        @errors << error.message
      end
    end

    def consumer_params
      ActionController::Parameters.new(params).permit(:name, :tenant_id, :address, :email, :phone_number)
    end
  end
end

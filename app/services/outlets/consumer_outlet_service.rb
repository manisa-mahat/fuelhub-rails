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
      begin
        consumer = Consumer.find(params[:consumer_id])
          if consumer.present?
            @outlet = ConsumerOutlet.new(consumer_outlet_params)
            if @outlet.save
              @success  = true
              @errors =[]
            end
          else
            @success = false
            @errors = [ error.message ]
          end
      rescue ActiveRecord::ActiveRecordError => error
        @success = false
        @errors << error.message
      end
    end

    def get_outlets
      begin
        # debugger
        consumer = Consumer.find(params[:id])
        if consumer.present?
          @outlets = consumer.consumer_outlets
          @success = true
          @errors = []
        else
          @success = false
          @errors << "Customer not found"
        end
      rescue ActiveRecord::Rollback => e
          @success = false
          @errors << e.message
      end
    end

    def destroy_outlets
      begin
        consumer_outlet = ConsumerOutlet.find(params[:id])
          if consumer_outlet.destroy!
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

    def update_outlets
      begin
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
  end
end

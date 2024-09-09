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

    private

    def create_outlets
      begin
        @outlet = ConsumerOutlet.new(consumer_outlet_params)
        if @outlet.save
          @success  = true
          @errors =[]
        end
      rescue ActiveRecord::ActiveRecordError => error
        @success = false
        @errors << error.message
      end
    end

    def consumer_outlet_params
      ActionController::Parameters.new(params).permit(:name, :address)
    end
  end
end

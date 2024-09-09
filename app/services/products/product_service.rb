
module Products
  class ProductService
    attr_reader :params
    attr_accessor :success, :errors, :product, :products

    def initialize(params = {})
    @params = params
    @success = false
    @errors = []
    end


    def execute_create_product
      create_product
      self
    end

    def success?
      @success
    end

    private
    def get_products
      begin
        @products = Product.all.reverse
        @success = true
        @errors = []
      rescue ActiveRecord::Rollback => e
          @success = false
          @errors << e.message
      end
    end

    def create_product
      ActiveRecord::Base.transaction do
        @product = Product.new(product_params)
        if @product.save!
          @success = true
          @errors = []
        end
      end

    rescue ActiveRecord::RecordInvalid => err
        @success = false
        @errors << err.message
    rescue ActiveRecord::RecordNotFound => err
        @success = false
        @errors << err.message
    end

    def product_params
      ActionController::Parameters.new(params).permit(:name, :category, :status, :unit)
    end
  end
end

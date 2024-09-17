
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

    def execute_update_product
      update_product
      self
    end

    def execute_get_product
      get_products
      self
    end

    def execute_delete_product
      delete_product
      self
    end

    def success?
      @success
    end

    private
    def get_products
      begin
        # Fetch products where tenant_id matches the current_user's tenant_id
        @products = Product.where(tenant_id: current_user.tenant_id).order(created_at: :DESC)

        @success = true
        @errors = []
      rescue ActiveRecord::Rollback => e
        @success = false
        @errors << e.message
      end
    end

    def create_product
      begin
        if current_user.present?
          ActsAsTenant.with_tenant(current_user.tenant) do
            @product = Product.new(product_params.merge(user_id: current_user.id))
            if @product.save!
              @success = true
              @errors = []
            else
              @success = false
              @errors =product.errors.full_messages
            end
          end
        else
          @success = false
          @errorrs = [ "Product Cannot be created." ]
        end
      rescue ActiveRecord::RecordInvalid => err
        @success = false
        @errors << err.message
      rescue ActiveRecord::RecordNotFound => err
        @success = false
        @errors << err.message
      end
    end

    def update_product
      begin
        @product = Product.find(params[:id])
        if current_user.present?
          if @product.present?
            @product.update!(product_params)
            @success = true
            @errors = []
          else
            @success = false
            @errors = product.errors.full_messages
          end
        else
          @success = false
          @errorrs = [ "Product Cannot be updated." ]
        end
      rescue ActiveRecord::RecordNotFound => e
        @success = false
        @errors = [ e.message ]

      rescue StandardError => e
        @success = false
        @errors = [ e.message ]
      end
    end

    def delete_product
      begin
        @product = Product.find(params[:id])
        if current_user.present?
          if @product.destroy!
            @success = true
            @errors = []
          else
            @success = false
            @errors = product.errors.full_messages
          end
        else
          @success = false
          @errorrs = [ "Product Cannot be deleted." ]
        end

      rescue ActiveRecord::RecordNotFound => e
        @success = false
        @errors = [ e.message ]

      rescue StandardError => e
        @success = false
        @errors = [ e.message ]
      end
    end

    def product_params
      ActionController::Parameters.new(params).permit(:name, :category, :status, :unit)
    end

    def current_user
      current_user = params[:current_user]
      @current_user ||= current_user
    end
  end
end

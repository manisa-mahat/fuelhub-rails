module LineItems
  class LineItemService
    attr_reader :params, :user
    attr_accessor :line_item

    def initialize(params, user:)
      @params = params
      @user = user
    end

    def perform_create_line_item
      create_line_item
    end

    def execute_delete_line_item(id)
      delete_line_item(id)
    end

    def execute_update_line_item(id)
      update_line_item(id)
    end

    def fetch_line_items_by_product(product_id)
      line_items_by_product(product_id)
    end

    private

    def create_line_item
      begin
        @line_item = LineItem.new(line_item_params.merge(user_id: @user.id))
        if @line_item.save!
          success_response(@line_item)
        else
          error_response(@line_item.errors.full_messages)
        end
      rescue ActiveRecord::RecordInvalid => e
        error_response([ e.message ])
      end
    end

    def update_line_item(id)
      find_line_item(id)

      if @line_item.update(line_item_params)
        success_response(@line_item)
      else
        error_response(@line_item.errors.full_messages)
      end
    end

    def delete_line_item(id)
      find_line_item(id)
      if @line_item.destroy
        success_response(@line_item)
      else
        error_response(@line_item.errors.full_messages)
      end
    end

    def line_items_by_product(product_id)
      line_items = LineItem.where(product_id: product_id)
      if line_items.present?
        success_response(line_items)
      else
        error_response([ "No line items found for product ID #{product_id}" ])
      end
    end

    def current_user
      current_user ||= params[:current_user]
    end

    def find_line_item(id)
      @line_item = LineItem.find(id)
    end

    def line_item_params
      ActionController::Parameters.new(params)
        .require(:line_item)
        .permit(
          :product_id,
          :status,
          :quantity,
          :product,
          :delivery_order_id
        )
    end

    def success_response(line_item)
      OpenStruct.new(success: true, line_item: line_item, errors: [])
    end

    def error_response(errors)
      OpenStruct.new(success: false, line_item: nil, errors: errors)
    end
  end
end

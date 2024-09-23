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

    def execute_delete_line_item
      delete_line_item
    end

    def execute_update_line_item
      update_line_item
    end

    private

    def create_line_item
      begin
        @line_item = LineItem.new(line_item_params.merge(user_id: current_user.id, tenant_id: current_user.tenant_id))
        if @line_item.save!
          success_response(@line_item)
        else
          error_response(@line_item.errors.full_messages)
        end
      rescue ActiveRecord::RecordInvalid => e
        error_response([ e.message ])
      end
    end

    def update_line_item
      find_line_item

      if @line_item.update(line_item_params)
        success_response(@line_item)
      else
        error_response(@line_item.errors.full_messages)
      end
    end

    def delete_line_item
      find_line_item
      if @line_item.destroy
        success_response(@line_item)
      else
        error_response(@line_item.errors.full_messages)
      end
    end

    def current_user
      @user
    end

    def find_line_item
      @line_item = LineItem.find(id)
    end

    def line_item_params
      ActionController::Parameters.new(params)
        .require(:line_item)
        .permit(
          :name,
          :quantity,
          :unit,
          :status
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

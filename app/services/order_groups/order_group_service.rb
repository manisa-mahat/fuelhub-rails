module OrderGroups
  class OrderGroupService
    attr_reader :params, :user
    attr_accessor :order_group
    attr_accessor :order_group, :consumer

    def initialize(params, user:)
      @params = params
      @user = user
    end

    def perform_create_order_group
      create_order_group
    end

    def execute_delete_order_group(id, recurring)
      delete_order_group(id, recurring)
    end

    def execute_update_order_group(id)
      update_order_group(id)
    end


    private

  # def create_order_group
  #   if current_user.nil?
  #     return error_response([ "User not Authenticated." ])
  #   end

  #   begin
  #     @consumer = Consumer.find(order_group_params[:consumer_id])
  #     @order_group = OrderGroup.new(order_group_params.merge(user_id: current_user.id, tenant_id: current_user.tenant_id))
  #     if @order_group.save
  #       # Mailer Integration
  #       OrderGroupMailer.create_order_mailer(@consumer, @order_group).deliver_now
  #       success_response(@order_group)
  #     else
  #       error_response(@order_group.errors.full_messages)
  #     end
  #   rescue ActiveRecord::RecordInvalid => e
  #     error_response([ e.message ])
  #   rescue StandardError => e
  #     error_response([ e.message ])
  #   end
  # end
  def create_order_group
    begin
      if current_user.present?
        ActsAsTenant.with_tenant(current_user.tenant) do
          @consumer = Consumer.find(order_group_params[:consumer_id])
          @order_group = OrderGroup.new(order_group_params.merge(user_id: current_user.id, tenant_id: current_user.tenant_id))
          if @order_group.save!
            # Mailer Integration

            OrderGroupMailer.create_order_mailer(@consumer, @order_group).deliver_now
            success_response(@order_group)
          else
              error_response(@order_group.errors.full_messages)
          end
        end
      else
        error_response([ "User not authenticated." ])
      end
    rescue ActiveRecord::RecordInvalid => e
    error_response([ e.message ])
    rescue StandardError => e
    error_response([ e.message ])
    end
  end

  def update_order_group(id)
    if current_user.nil?
      return error_response([ "User not Authenticated." ])
    end

    find_order_group(id)

    if @order_group.update(order_group_params)
      success_response(@order_group)
    else
      error_response(@order_group.errors.full_messages)
    end
  end

  def delete_order_group(id, recurring)
    find_order_group(id)

    if @order_group.recurring != recurring
      return error_response([ "The recurring status does not match for this order." ])
    end

    if @order_group.destroy
      success_response(@order_group)
    else
      error_response(@order_group.errors.full_messages)
    end
  end


    def current_user
      @user
    end



    def find_order_group(id)
      @order_group = OrderGroup.find(id)
    end

    def order_group_params
      ActionController::Parameters.new(params)
        .require(:order_group)
        .permit(
          :status,
          :planned_at,
          :completed_at,
          :consumer_id,
          :recurring,
          :order_group_id,
          :start_date,
          :end_date,
          :frequency,
          :consumer,
          delivery_order_attributes: [
            :planned_at,
            :completed_at,
            :consumer_outlet_id,
            :consumer_outlet,
            line_items_attributes: [
              :status,
              :quantity,
              :product,
              :delivery_order_id,
              :product_id
            ]
          ]
        )
    end

    def success_response(order_group)
      OpenStruct.new(success: true, order_group: order_group, errors: [])
    end

    def error_response(errors)
      OpenStruct.new(success: false, order_group: nil, errors: errors)
    end
  end
end

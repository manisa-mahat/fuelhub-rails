require "csv"

module Csv
  class ImportProductService
    attr_reader :success_count, :errors

    def initialize(file_path, current_user)
      @file_path = file_path
      @current_user = current_user
      @success_count = 0
      @errors = []
    end

    def import
      if @current_user.tenant.nil?
        @errors << "Error: Tenant must exist for the current user."
        return { success_count: @success_count, errors: @errors }
      end

      ActsAsTenant.with_tenant(@current_user.tenant) do
        CSV.foreach(@file_path, headers: true) do |row|
          puts "Processing row: #{row.to_h}"

          category = row["category"]
          name = row["name"]
          status = row["status"]
          unit = row["unit"]

          product = Product.new(
            category: category,
            name: name,
            status: status,
            unit: unit,
            user: @current_user
          )

          if product.save
            @success_count += 1
          else
            @errors << "Error creating product: #{product.errors.full_messages.join(', ')}"
          end
        end
      end
      { success_count: @success_count, errors: @errors }
    end
  end
end

module Mutations
  module Csv
    class ProductCsv < Mutations::BaseMutation
      argument :file_path, String, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: true

      def resolve(file_path:)
        current_user = context[:current_user]

        service = ::Csv::ImportProductService.new(file_path, current_user)
        import_result = service.import

        {
          success: import_result[:errors].empty?,
          errors: import_result[:errors]
        }
      rescue StandardError => e
        { success: false, errors: [ e.message ] }
      end
    end
  end
end

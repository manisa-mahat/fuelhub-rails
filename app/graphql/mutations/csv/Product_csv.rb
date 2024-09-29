module Mutations
  module Csv
    class ProductCsv < Mutations::BaseMutation
      argument :file, ApolloUploadServer::Upload, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: true

      def resolve(file:)
        current_user = context[:current_user]

        temp_file_path = save_file_temporarily(file)

        service = ::Csv::ImportProductService.new(temp_file_path, current_user)
        import_result = service.import

        {
          success: import_result[:errors].empty?,
          errors: import_result[:errors]
        }
      rescue StandardError => e
        { success: false, errors: [ e.message ] }
      ensure

        File.delete(temp_file_path) if temp_file_path && File.exist?(temp_file_path)
      end

      private

      def save_file_temporarily(uploaded_file)
        temp_file = Tempfile.new([ "uploaded_csv", ".csv" ], Rails.root.join("tmp"))
        temp_file.binmode
        temp_file.write(uploaded_file.read)
        temp_file.rewind
        temp_file.path
      end
    end
  end
end

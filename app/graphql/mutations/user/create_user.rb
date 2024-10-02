module Mutations
  module User
    class CreateUser < BaseMutation
      argument :email, String
      argument :password, String
      argument :password_confirmation, String
      argument :tenant_id, Integer

      field :user, Types::User::UserType, null: true
      field :errors, [ String ], null: false

      def resolve(email:, password:, password_confirmation:, tenant_id:)
        existing_user = ::User.find_by(email: email)
        if existing_user
          return {
            user: nil,
            errors: [ "User with email #{email} is already registered" ]
          }
        end

        user = ::User.new(email: email, password: password, password_confirmation: password_confirmation, tenant_id: tenant_id)

        if user.save
          {
            user: user,
            errors: []
          }
        else
          {
            user: nil,
            errors: user.errors.full_messages
          }
        end
      end
    end
  end
end

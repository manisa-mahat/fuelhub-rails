module Mutations
  module User
    class CreateUser < BaseMutation
      null true
      argument :email, String
      argument :password, String
      argument :password_confirmation, String
      argument :tenant_id, Integer

      field :user, Types::User::UserType, null: true
      field :errors, [ String ], null: false

      def resolve(email:, password:, password_confirmation:, tenant_id:)
        user = ::User.create(email: email, password: password, password_confirmation: password_confirmation, tenant_id: tenant_id)
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

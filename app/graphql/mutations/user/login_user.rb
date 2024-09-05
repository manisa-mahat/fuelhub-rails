module Mutations
  module User
    class LoginUser < BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
      argument :tenant_id, Integer, required: true

      field :token, String, null: false
      field :message, String, null: true
      field :user, Types::User::UserType

      def resolve(email:, password:, tenant_id:)
        user = ::User.find_by(email: email)
        if user && user.valid_password?(password) && valid_tenant?(user, tenant_id)
          jti = SecureRandom.uuid
          user.update!(jti: jti)
          token = JWT.encode({ user_id: user.id, exp: 1.hour.from_now.to_i }, "secret", "HS256")
          { token: token, message: "Logged IN", user: user }
        else
          raise GraphQL::ExecutionError, "Invalid email or password or tenant"
        end
      end
      def valid_tenant?(user, tenant_id)
        user.tenant_id == tenant_id
      end
    end
  end
end

module Mutations
  module User
    class LogoutUser < BaseMutation
      field :success, Boolean, null: false
      field :message, String, null: true

      def resolve
        user = context[:current_user]

        if user
          if user.jti == "logged out"
            {
              success: false,
              message: "User is already logged out"
            }
          else

            if user.update(jti: SecureRandom.uuid)
              {
                success: true,
                message: "User successfully logged out"
              }
            else
              {
                success: false,
                message: "Failed to update logout status"
              }
            end
          end
        else
          { success: false, message: "No user found" }
        end
      end
    end
  end
end

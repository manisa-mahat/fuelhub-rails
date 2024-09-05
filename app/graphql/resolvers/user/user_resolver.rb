module Resolvers
  module User
    class UserResolver < BaseResolver
      type Types::User::UserType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        ::User.find(id)
      end
    end
  end
end

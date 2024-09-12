module Resolvers
  module User
    class UsersResolver < BaseResolver
      type [ Types::User::UserType ], null: false

      def resolve
        ::User.all
      end
    end
  end
end

module Types
  class QueryType < Types::BaseObject
    field :users, Types::UserType, null: true do
      description 'Query all users'
    end
    def users
      User.all
    end

    field :current_user, Types::UserType, null: true do
      description 'Query the current logged in user'
    end
    def current_user
      context[:current_user]
    end
  end
end

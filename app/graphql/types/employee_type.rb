module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :type, Types::EmployType, null: false
  end
end

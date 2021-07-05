module Types
  class Type < Types::BaseObject
    field :id, ID, null: false
    field :type, String, null: true
    field :min_hours, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

module Types
  class AttendanceType < Types::BaseObject
    field :id, ID, null: false
    field :employment_id, Integer, null: false
    field :sign_in, GraphQL::Types::ISO8601DateTime, null: true
    field :sign_out, GraphQL::Types::ISO8601DateTime, null: true
    field :date, GraphQL::Types::ISO8601Date, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

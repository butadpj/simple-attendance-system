module Types
  class AttendanceType < Types::BaseObject
    field :id, ID, null: false
    field :employeeType_id, Integer, null: false
    field :sign_in, Types::TimeType, null: true
    field :sign_out, Types::TimeType, null: true
    field :date, GraphQL::Types::ISO8601Date, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

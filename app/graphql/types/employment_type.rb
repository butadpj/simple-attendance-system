module Types
  class EmploymentType < Types::BaseObject
    field :id, ID, null: false
    field :employee, Types::EmployeeType, null: false, method: :employee
    field :type, Types::Type, null: false, method: :type

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

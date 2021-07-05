module Types
  class EmploymentType < Types::BaseObject
    field :id, ID, null: false
    field :employee_id, Integer, null: false
    field :type_id, Integer, null: false

    field :from_employee, Types::EmployeeType, null: false, method: :employee
    field :from_type, Types::Type, null: false, method: :type

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

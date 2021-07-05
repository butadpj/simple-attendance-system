module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false, method: :user
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # field :employment_type, Types::EmploymentType, null: false, method: :employment
  end
end

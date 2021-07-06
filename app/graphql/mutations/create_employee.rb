module Mutations
  class CreateEmployee < BaseMutation
    # TODO: define return fields
    field :employee, Types::EmployeeType, null: false

    # TODO: define arguments

    # TODO: define resolve method
    def resolve
      @user = context[:current_user]
      @employee = Employee.create!(user: @user)
      { employee: @employee }
    end
  end
end

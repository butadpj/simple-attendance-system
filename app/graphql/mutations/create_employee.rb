module Mutations
  class CreateEmployee < BaseMutation
    # TODO: define return fields
    field :employee, Types::EmployeeType, null: false
    # TODO: define arguments
    argument :type, String, required: true
    # TODO: define resolve method
    def resolve(type:)
      @user = context[:current_user]
      @employee = Employee.create!(user: @user)
      @type = Type.find_by(name: type)
      Employment.create!(employee_id: @employee.id, type_id: @type.id)
      { employee: @employee }
    end
  end
end

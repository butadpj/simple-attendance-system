module Mutations
  class CreateEmployee < BaseMutation
    # TODO: define return fields
    field :employee, Types::EmployeeType, null: false
    field :employment, Types::EmploymentType, null: false
    # TODO: define arguments
    argument :type, String, required: true


    # TODO: define resolve method
    def resolve(type:)
      @user = context[:current_user]
      @type = Type.find_by(name: type)
      @employee = Employee.create!(user: @user)
      @employment = Employment.create!(employee_id: @employee.id, type_id: @type.id)

      { employee: @employee, employment: @employment }
    end
  end
end

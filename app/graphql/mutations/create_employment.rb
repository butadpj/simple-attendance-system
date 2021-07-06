module Mutations
  class CreateEmployment < BaseMutation
    # TODO: define return fields
    field :employment, Types::EmployeeType, null: false

    # TODO: define arguments
    argument :type, String, required: true

    # TODO: define resolve method
    def resolve(type:)
      @user = context[:current_user]
      @employee = User.find(@user.id).employee
      @type = Type.find_by(name: type)
      @employment = Employment.create!(employee_id: @employee.id, type_id: @type.id)
      { employment: @employment }
    end
  end
end

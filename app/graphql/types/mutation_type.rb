module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::RegisterUser
    field :login_user, mutation: Mutations::LoginUser
    field :logout_user, mutation: Mutations::LogoutUser
    field :create_attendance, mutation: Mutations::CreateAttendance
    field :create_employee, mutation: Mutations::CreateEmployee
    field :create_employment, mutation: Mutations::CreateEmployment
  end
end

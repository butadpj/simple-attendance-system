module Types
  class MutationType < Types::BaseObject
    field :create_attendance, mutation: Mutations::CreateAttendance
    field :create_employee, mutation: Mutations::CreateEmployee
  end
end

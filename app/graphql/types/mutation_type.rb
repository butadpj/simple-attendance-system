module Types
  class MutationType < Types::BaseObject
<<<<<<< HEAD
    field :create_attendance, mutation: Mutations::CreateAttendance
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
=======
    field :create_employee, mutation: Mutations::CreateEmployee
>>>>>>> main
  end
end

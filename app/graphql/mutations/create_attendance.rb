module Mutations
  class CreateAttendance < BaseMutation
    field :attendance, Types::AttendanceType, null: true
    field :message, String, null: true

    argument :employment_id, ID, required: true

    def resolve(employment_id:)
      attendance = Attendance.new(employment_id: employment_id, sign_in: Time.now, sign_out: nil,
                                  date: Date.current)

      if attendance.save
        {
          attendance: attendance,
          message: 'Your attendance for today has been successfully saved!',
          errors: []
        } else {
          attendance: nil,
          message: "Something's wrong with your attendance, Please try again!",
          errors: attendance.errors.full_messages
        }
      end
    end
  end
end

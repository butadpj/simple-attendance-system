module Mutations
  class CreateAttendance < BaseMutation
    
    field :attendance, Types::AttendanceType, null: true
    field :message, String, null: true

    argument :employeeType_id, ID, required: true
    argument :sign_in, Types::TimeType, required: true
    argument :sign_out, Types::TimeType, required: true
    argument :date, GraphQL::Types::ISO8601Date, required: true

    def resolve(employeeType_id:, sign_in:, sign_out:, date:)
      attendance = Attendance.new(employeeType_id: employeeType_id, sign_in: sign_in, sign_out: sign_out, date: date)

      if (attendance.save) 
        {
          attendance: attendance,
          message: "Your attendance for today has been successfully saved!",
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

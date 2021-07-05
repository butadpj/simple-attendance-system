module Types
  class QueryType < Types::BaseObject

    # USERS
    field :users, [Types::UserType], null: true do
      description 'Query all users'
    end

    field :current_user, Types::UserType, null: true do
      description 'Query the current logged in user'
    end

    field :usersCount, Integer, null: true do
      description 'Query that counts all users'
    end

    def users
      User.all
    end

    def current_user
      context[:current_user]
    end

    def usersCount
      User.count
    end

    # ATTENDANCE
    # field :attendances, [Types::AttendanceType], null: true do
    #   description 'Query all attendances'
    # end

    # field :current_attendance, Types::AttendanceType, null: true do
    #   description 'Query the current logged in attendance'
    # end

    # field :attendancesCount, Integer, null: true do
    #   description 'Query that counts all attendances'
    # end

    def attendances
      Attendance.all
    end

    def current_attendance
      context[:current_user]
    end

    def attendancesCount
      Attendance.count
    end

  end
end

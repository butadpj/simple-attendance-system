module Mutations
  class LogoutUser < BaseMutation
    # TODO: define return fields
    field :message, String, null: true

    # TODO: define resolve method
    def resolve
      @message = ''
      if context[:current_user]
        context[:session][:token] = ''
        @message = 'User has logged out'
      else
        @message = "There's no currently logged in user"
      end
      { message: @message }
    end
  end
end

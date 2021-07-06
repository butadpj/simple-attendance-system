module Mutations
  class LoginUser < BaseMutation
    # TODO: define return fields
    field :user, Types::UserType, null: false

    # TODO: define arguments
    field :token, String, null: true
    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    # TODO: define resolve method
    def resolve(credentials:)
      # Return credentials if there's any, null if false
      return unless credentials

      @user = User.find_by(username: credentials[:username])

      # ensures we have the correct user
      return unless @user
      return unless @user.authenticate(credentials[:password])

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      @token = crypt.encrypt_and_sign("user-id:#{@user.id}")

      context[:session][:token] = @token

      { user: @user, token: @token }
    end
  end
end

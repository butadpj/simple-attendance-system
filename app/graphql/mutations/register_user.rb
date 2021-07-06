module Mutations
  class RegisterUser < BaseMutation
    null true
    class AuthProviderRegisterData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    field :user, Types::UserType, null: false
    field :token, String, null: true

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :auth_provider, AuthProviderRegisterData, required: true

    def resolve(first_name:, last_name:, email:, auth_provider:)
      @user = User.create!(
        first_name: first_name,
        last_name: last_name,
        email: email,
        username: auth_provider&.[](:credentials)&.[](:username),
        password: auth_provider&.[](:credentials)&.[](:password)
      )

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
      @token = crypt.encrypt_and_sign("user-id:#{@user.id}")

      context[:session][:token] = @token

      { user: @user, token: @token }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end

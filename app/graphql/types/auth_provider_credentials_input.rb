module Types
  class AuthProviderCredentialsInput < Types::BaseInputObject
    graphql_name 'AUTH_PROVIDER_CREDENTIALS'

    argument :username, String, required: true
    argument :password, String, required: true
  end
end

class GraphqlController < ApplicationController
  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      session: SESSION,
      current_user: current_user(SESSION[:token]),
      admin?: admin?(SESSION[:token])
    }
    result = AttendanceSystemSchema.execute(query, variables: variables, context: context,
                                                   operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development(e)
  end

  private

  def current_user(token)
    return if token.blank?

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    user_id = crypt.decrypt_and_verify(token).gsub('user-id:', '').to_i
    User.find(user_id)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  def admin?(token)
    return if token.blank?

    user = current_user(token)
    user.admin
  end

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end

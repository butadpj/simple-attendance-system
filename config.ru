# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'rack/cors'

run Rails.application
Rails.application.load_server

use Rack::Cors do
  # allow all origins in development
  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: %i[get post delete put options]
  end
end

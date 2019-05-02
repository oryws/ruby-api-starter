# frozen_string_literal: true

require 'grape'

# Load files from the models and api folders
# Dir["#{File.dirname(__FILE__)}/api/**/*.rb"].each { |f| require f }
require './api/v1/def'

module API
  class Root < Grape::API
    format :json
    prefix :api

    # Simple endpoint to get the current status of our API.
    get :status do
      { status: 'ok' }
    end

    mount Version1::Def
  end
end

# Mounting the Grape application
Application = Rack::Builder.new do
  map '/' do
    run API::Root
  end
end

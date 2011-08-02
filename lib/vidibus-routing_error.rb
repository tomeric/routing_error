$:.unshift(File.join(File.dirname(__FILE__), "..", "lib", "vidibus"))
require "routing_error/rack"

module Vidibus::RoutingError
  class Engine < ::Rails::Engine
    config.app_middleware.insert_after("ActionDispatch::ShowExceptions", "Vidibus::RoutingError::Rack")
  end
end
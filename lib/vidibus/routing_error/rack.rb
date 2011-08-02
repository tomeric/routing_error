module Vidibus
  module RoutingError
    class Rack
      def initialize(app)
        @app = app
      end

      def call(env)
        response = @app.call(env)
        if response[0] == 404
          request = ::Rack::Request.new(env)
          env["vidibus-routing_error.request_uri"] = request.fullpath
          env["PATH_INFO"] = env["REQUEST_URI"] = "/routing_error"
          @app.call(env)
        else
          response
        end
      end
    end
  end
end

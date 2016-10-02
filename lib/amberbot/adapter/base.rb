##
# The abstract adapter for Amber Bot

require "active_support"
require "active_support/core_ext/object"

module AmberBot::Adapter
  class BadRequestError; end

  class Base
    class << self
      attr_reader :instance

      def compile
        @instance ||= const_get(name).new
      end
    end

    SIGATURE_HEADER = "HTTP_X_SIGNATURE".freeze

    def verify(request, response)
      response.status = 200
      response.write({verify: :success}.to_json)
      response.finish
    end

    def receive(request, response)
      body = request.body.read
      validate_signature(body, request.params[SIGATURE_HEADER]) if secret
      events = parse_events(body)
      AmberBot::Context.match(*[events].flatten)
    rescue BadRequestError
      # TODO: Response error status
    end

    def handle(request, response)
      if request.get?
        verify(request, response)
      else
        receive(request, response)
      end
    end

    def secret
      nil
    end

    def parse_events(body)
      raise NotImplementedError.new("You muse implement parse_events method")
    end

    def validate_signature!(signature, body)
      raise NotImplementedError.new("You must implement validate_signature method")
    end
  end
end

require "active_support"
require "active_support/core_ext/object"

module AmberBot
  class API
    class << self
      attr_reader :instance

      LOCK = Mutex.new

      def compile
        @instance ||= new
      end

      def call(env)
        LOCK.synchronize { compile } unless instance
        call!(env)
      end

      def call!(env)
        instance.call(env)
      end
    end

    LOCK = Mutex.new

    ADAPTER_PATTERN = /^\/(?<adapter>[^\/.]+)?.*/

    ERRORS = {
      invalid_adapter: {message: "Adapter not implement or invalid", code: 0x400}
    }

    def initialize
      @env = {}
    end

    def call(env)
      @env = env
      return response(ERRORS[:invalid_adapter], status: 400) unless current_adapter = adapter
      LOCK.synchronize { current_adapter.compile } unless current_adapter.instance
      current_adapter.instance.handle(Rack::Request.new(env), Rack::Response.new)
    rescue NameError
      response(ERRORS[:invalid_adapter], status: 400)
    end

    def adapter
      return unless matches = ADAPTER_PATTERN.match(@env['PATH_INFO'])
      Adapter.get(matches[:adapter])
    end

    def response(body, status: 200)
      body = body.to_json
      [
        status,
        {
          "Content-Type" => "application/json",
          "Content-Length" => "#{body.bytesize}"
        },
        [body]
      ]
    end
  end
end

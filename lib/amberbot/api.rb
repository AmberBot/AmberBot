require "active_support"
require "active_support/core_ext/object"

module Amberbot
  class API
    class << self
      def call(env)
        response = {status: 200}.to_json
        [
          200,
          {
            "Content-Type" => "application/json",
            "Content-Length" => "#{response.bytesize}"
          },
          [response]
        ]
      end
    end
  end
end

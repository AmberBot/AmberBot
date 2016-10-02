require "amberbot/adapter/base"
require "amberbot/adapter/simple"

module AmberBot
  module Adapter
    def self.get(adapter)
      return unless adapter

      if klass = @adapters[adapter]
        klass.split("::").inject(Object) { |o, x| o.const_get(x) }
      else
        const_get(adapter)
      end
    end

    def self.register(adapter, klass)
      @adapters ||= {}
      @adapters[adapter.to_s] = klass.to_s
    end

    register "simple", AmberBot::Adapter::Simple
  end
end

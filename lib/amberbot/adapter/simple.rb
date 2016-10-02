module AmberBot::Adapter
  class Simple < Base
    def parse_events(body)
    end

    def validate_signature(signature, body)
      true
    end
  end
end

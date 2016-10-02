require "rack"
require "rspec"

require "amberbot"

describe AmberBot::Adapter::Base do
  context "validate_signature!" do
    it "raise NotImplementedError" do
      request = Rack::Request.new({})
      response = Rack::Response.new
      expect { subject.validate_signature!(request, response) }.to raise_error(NotImplementedError)
    end
  end

  context "parse_events" do
    it "raise NotImplementedError" do
      body = ""
      expect { subject.parse_events(body) } .to raise_error(NotImplementedError)
    end
  end
end

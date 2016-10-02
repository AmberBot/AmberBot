require 'rspec'
require 'rack/test'

require 'amberbot/api'

describe AmberBot::API do
  include Rack::Test::Methods

  # Prepare for Rack::Text
  subject { AmberBot::API }
  let(:app) { subject }

  let(:invalid_adapter) { AmberBot::API::ERRORS[:invalid_adapter].to_json }

  it "return invalid adapter status" do
    get '/'
    expect(last_response).to be_bad_request
    expect(last_response.body).to eq(invalid_adapter)
  end

  it "return current used adapter" do
    get '/facebook'
    expect(last_response).to be_ok
    expect(last_response.body).to eq({adapter: :facebook}.to_json)
  end
end

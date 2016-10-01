require 'rspec'
require 'rack/test'

require 'amberbot/api'

describe AmberBot::API do
  include Rack::Test::Methods

  # Prepare for Rack::Text
  subject { AmberBot::API }
  let(:app) { subject }

  it "return 200 status in json format" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq({status: 200}.to_json)
  end
end

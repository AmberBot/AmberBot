require "rspec"

require "amberbot"

describe AmberBot::Adapter do
  it "can register adapter" do
    subject.register "base", AmberBot::Adapter::Base
    expect(subject.get("base")).to eq(AmberBot::Adapter::Base)
  end

  it "can get adapter" do
    allow(subject).to receive(:get).and_return(AmberBot::Adapter::Base)
    expect(subject.get("base")).to eq(AmberBot::Adapter::Base)
  end
end

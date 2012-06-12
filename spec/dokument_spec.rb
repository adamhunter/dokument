require 'spec_helper'

describe Dokument do
  it "is a module" do
    Dokument.should be_a(Module)
  end

  it "has a client" do
    Dokument.client.should be_a(Riak::Client)
  end
end

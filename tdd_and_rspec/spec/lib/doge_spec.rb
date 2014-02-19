require "spec_helper"
require "lib/doge"

describe Doge do
let(:doge){ Doge.new }

  it "has a name" do
    doge.name = "Doge"
    doge.name.should == "Doge"
  end

  it "can bark" do
    doge.speak.should == "much test, very TDD, wow, such red/green/repeat"
  end

end

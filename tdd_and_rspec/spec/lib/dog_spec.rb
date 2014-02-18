require "spec_helper"
require "lib/dog"

describe Dog do
let(:dog){ Dog.new }

  it "has a name" do
    dog.name = "Rufis"
    dog.name.should == "Rufis"
  end

  it "can bark" do
    dog.speak.should == "bark, bark"
  end

end

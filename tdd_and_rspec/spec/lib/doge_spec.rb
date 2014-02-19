require 'spec_helper'
require 'lib/doge'

describe Doge do
let(:doge){ Doge.new("Such wow") }

  it "can bark" do
    doge.bark.should == "woof"
  end

  it "urinate" do
    doge.urinate.should be_true
  end

  it "has a name" do
    doge.name.should_not be_nil
    doge.name.should == "Such wow"
  end

  it "has an age" do
    doge.age = 5
    doge.age.should_not be_nil
    doge.dog_age.should_not be_nil
    doge.dog_age.should == 35
  end

  it "can find a leg" do
    doge.leg.should_not be_nil
  end

end

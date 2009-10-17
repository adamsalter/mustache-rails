require 'spec_helper'

describe HelloWorld do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    HelloWorld.create!(@valid_attributes)
  end
end

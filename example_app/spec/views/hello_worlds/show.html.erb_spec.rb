require 'spec_helper'

describe "/hello_worlds/show.html.erb" do
  include HelloWorldsHelper
  before(:each) do
    assigns[:hello_world] = @hello_world = stub_model(HelloWorld)
  end

  it "renders attributes in <p>" do
    render
  end
end

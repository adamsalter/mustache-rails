require 'spec_helper'

describe "/hello_worlds/index.html.erb" do
  include HelloWorldsHelper

  before(:each) do
    assigns[:hello_worlds] = [
      stub_model(HelloWorld),
      stub_model(HelloWorld)
    ]
  end

  it "renders a list of hello_worlds" do
    render
  end
end

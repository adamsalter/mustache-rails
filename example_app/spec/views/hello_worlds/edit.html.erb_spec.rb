require 'spec_helper'

describe "/hello_worlds/edit.html.erb" do
  include HelloWorldsHelper

  before(:each) do
    assigns[:hello_world] = @hello_world = stub_model(HelloWorld,
      :new_record? => false
    )
  end

  it "renders the edit hello_world form" do
    render

    response.should have_tag("form[action=#{hello_world_path(@hello_world)}][method=post]") do
    end
  end
end

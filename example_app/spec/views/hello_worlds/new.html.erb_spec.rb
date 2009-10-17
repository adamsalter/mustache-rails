require 'spec_helper'

describe "/hello_worlds/new.html.erb" do
  include HelloWorldsHelper

  before(:each) do
    assigns[:hello_world] = stub_model(HelloWorld,
      :new_record? => true
    )
  end

  it "renders new hello_world form" do
    render

    response.should have_tag("form[action=?][method=post]", hello_worlds_path) do
    end
  end
end

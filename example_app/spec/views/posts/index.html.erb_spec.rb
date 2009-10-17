require 'spec_helper'

describe "/posts/index.html.erb" do
  include PostsHelper

  before(:each) do
    assigns[:posts] = [
      stub_model(Post),
      stub_model(Post)
    ]
  end

  it "renders a list of posts" do
    render
  end
end

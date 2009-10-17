require 'spec_helper'

describe "/posts/show.html.erb" do
  include PostsHelper
  before(:each) do
    assigns[:post] = @post = stub_model(Post)
  end

  it "renders attributes in <p>" do
    render
  end
end

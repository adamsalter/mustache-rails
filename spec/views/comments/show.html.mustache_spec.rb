require 'spec_helper'

describe "/comments/show.html.mustache" do
  include CommentsHelper
  before(:each) do
    assigns[:post] = @post = stub_model(Post)
  end

  it "renders attributes in <p>" do
    render
  end
end

require 'spec_helper'

describe "/comments/show.html.mustache" do
  include CommentsHelper
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment)
  end

  it "renders attributes in <p>" do
    render
  end
end

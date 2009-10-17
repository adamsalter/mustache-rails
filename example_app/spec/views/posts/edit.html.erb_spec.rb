require 'spec_helper'

describe "/posts/edit.html.erb" do
  include PostsHelper

  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :new_record? => false
    )
  end

  it "renders the edit post form" do
    render

    response.should have_tag("form[action=#{post_path(@post)}][method=post]") do
    end
  end
end

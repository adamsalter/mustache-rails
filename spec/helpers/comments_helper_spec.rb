require 'spec_helper'

describe CommentsHelper do

  it "is included in the helper object" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(CommentsHelper)
    included_modules.should_not include(PostsHelper)
  end

end

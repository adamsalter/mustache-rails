require 'spec_helper'

describe PostsHelper do

  #Delete this example and add some real ones or delete this file
  it "is included in the helper object" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(PostsHelper)
    included_modules.should_not include(CommentsHelper)
    included_modules.should_not include(CommentsHelper::Show)
  end

end

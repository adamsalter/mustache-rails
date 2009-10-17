module PostsHelper
  module Index
    def link_to_show_post
      link_to 'Show', post
    end

    def link_to_edit_post
      link_to 'Edit', edit_post_path(post)
    end

    def link_to_destroy_post
      link_to 'Destroy', post, :confirm => 'Are you sure?', :method => :delete
    end
    
    def link_to_new_post
      link_to 'New post', new_post_path
    end
  end
end

module PostsHelper
  def page_title
    "Every Good Post"
  end

  def post
    @post
  end

  def link_to_show_post
    link_to 'Show', context[:post]
  end

  def link_to_edit_post
    link_to 'Edit', edit_post_path(context[:post])
  end

  def link_to_destroy_post
    link_to 'Destroy', context[:post], :confirm => 'Are you sure?', :method => :delete
  end

  def link_to_new_post
    link_to 'New post', new_post_path
  end
  
  def link_to_index
    link_to 'Back', posts_path
  end
  
  module Index
    def posts
      @posts.map {|p| {:post => p} }
    end
  end
  
  module New
    def form_for_post
      # forms not working yet
      # form = ""
      # form_for(@post) do |f|
      #   form += f.error_messages
      #   form += f.text_field :title
      #   form += f.text_area :content
      #   form += content_tag('p') { f.submit 'Create'}
      # end
      # form
    end
  end
  
  module Edit
    def form_for_post
      # forms not working yet
      # form = ""
      # form_for(@post) do |f|
      #   form += f.error_messages
      #   form += f.text_field :title
      #   form += f.text_area :content
      #   form += content_tag('p') { f.submit 'Create'}
      # end
      # form
    end
  end

end

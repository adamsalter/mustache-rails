module PostsHelper
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
    def content_for_page_title
      "Index"
    end
    
    def content_for_meta_data
      {'Description' => 'Everything you love about Mustache and less fat'}
    end

    def post_title
      context[:post].title
    end
    
    def post_excerpt
      truncate(context[:post].content)
    end
    
    def posts
      @posts.map {|p| {:post => p} }
    end
  end
  
  module Show
    def content_for_page_title
      "Show"
    end
    
    def content_for_meta_data
      {'Description' => 'Everything you love about Mustache and less fat'}
    end

    def post_title
      @post.title
    end
    
    def post_content
      @post.content
    end
  end
  
  module New
    def content_for_page_title
      "New"
    end
    
    def content_for_meta_data
      {'Description' => 'Everything you love about Mustache and less fat'}
    end

    def form_for_post
      # form = ""
      # form_for(@post) do |f|
      #   form += f.error_messages
      #   form += f.text_field :title
      #   form += f.text_area :content
      #   form += content_tag('p') { f.submit 'Create'}
      # end
      # form
      "forms not working yet"
    end
  end
  
  module Edit
    def content_for_page_title
      "Edit"
    end
    
    def content_for_meta_data
      {'Description' => 'Everything you love about Mustache and less fat'}
    end

    def form_for_post
      # form = ""
      # form_for(@post) do |f|
      #   form += f.error_messages
      #   form += f.text_field :title
      #   form += f.text_area :content
      #   form += content_tag('p') { f.submit 'Create'}
      # end
      # form
      "forms not working yet"
    end
  end

end

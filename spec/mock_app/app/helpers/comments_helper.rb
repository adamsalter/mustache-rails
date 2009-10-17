module CommentsHelper
  def page_title
    "Every Good Comment Deserves A Free Rhinoplasty"
  end
  
  module Show
    def comment_title
      @comment.title
    end
    
    def comment_content
      @comment.content
    end
  end
end

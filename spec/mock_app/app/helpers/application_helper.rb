# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    if content_for_page_title
      "%s | Every Good Blog Deserves A Mustache" % content_for_page_title
    else
      "Welcome to - Who Deserves A Mustache!?!"
    end
  end
  
  def meta_data
    meta_data_hash = content_for_meta_data
    meta_data_hash.inject("") do |c, (k, v)| 
      c += ("<meta http-equiv='%s' content='%s' />" % [k, v])
    end
  end

  def link_scaffold_stylesheet
    stylesheet_link_tag 'scaffold'
  end
  
  def flash_notice
    flash[:notice]
  end
end

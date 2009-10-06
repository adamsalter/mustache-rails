require 'mustache/rails/template_handler'

class MustacheRails < Mustache
  include ActionController::UrlWriter
  include ActionView::Helpers

  attr_accessor :request, :response, :params, :controller, :view, :flash

  # ActionView::Helpers overrides the +render+ method, so we need to copy it
  # back from Mustache. Ugly.
  def render(html, context = {})
    @context = context = (@context || {}).merge(context)
    html = render_sections(html)
    @context = context
    render_tags(html)
  end

  # Use rails' html_escape ("h") for escaping.
  alias_method :escape, :html_escape
end


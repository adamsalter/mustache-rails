
class Mustache
  class Rails
    class TemplateHandler < ActionView::TemplateHandler

      def render(template, local_assigns, &block)
        mustache_class_name = template.path.gsub(".html.mustache", "").classify
        raise StandardError, mustache_class_name
        mustache_class = mustache_class_name.constantize

        result = mustache_class.new
        copy_instance_variables_to(result)
        result.template_file = Rails.root.join("app", "views", template.path)
        result.view          = @view
        result.controller    = result.view.controller
        result.request       = result.controller.request
        result.response      = result.controller.response
        result.params        = result.controller.params
        result.flash         = result.controller.send(:flash)
        result[:yield]       = block && block.call
        result.to_html
      end

      def copy_instance_variables_to(mustache)
        variables = @view.controller.instance_variable_names
        variables -= %w(@template)
        variables -= @view.controller.protected_instance_variables if @view.controller.respond_to?(:protected_instance_variables)
        variables.each {|name| mustache.instance_variable_set(name, @view.controller.instance_variable_get(name)) }
      end
    end
  end
end

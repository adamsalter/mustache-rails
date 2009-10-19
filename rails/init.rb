require "mustache"

module ::ActionView
  module TemplateHandlers
    class Mustache < TemplateHandler
      include Compilable

      def compile(template)
        view_action_helper =  "%sHelper::%s" % [template.base_path.classify.pluralize, template.name.classify]
        compiled_template = ::Mustache::Template.new(template.source, '.', 'mustache').compile

        template_in_context = <<-EOT
        extend ::Mustache::Rails::Helper
        extend #{view_action_helper} if defined? #{view_action_helper}
        context[:yield] = yield
        #{compiled_template}
        EOT

        template_in_context
      end
    end
  end
end

class ::Mustache
  module Rails
    module Helper
      def context
        @context ||= ::Mustache::Context.new(self)
      end
      # needed since compiled template code expects ctx = context
      alias :ctx :context
    end
  end
end

::ActionView::Template.register_template_handler(:mustache, ::ActionView::TemplateHandlers::Mustache)

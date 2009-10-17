module ActionView
  module TemplateHandlers
    class Mustache < TemplateHandler
      include Compilable

      def compile(template)
        view_action_helper =  "%sHelper::%s" % [template.base_path.classify.pluralize, template.name.classify]
        compiled_template = ::Mustache::Template.new(template.source, '.', 'mustache').compile

        template_in_context = <<-EOT
        extend #{view_action_helper} if defined? #{view_action_helper}
        def context
          @context ||= ::Mustache::Context.new(self)
        end
        def [](key)
          context[key.to_sym]
        end
        def []=(key, value)
          context[key.to_sym] = value
        end
        ctx = context
        #{compiled_template}
        EOT
        
        template_in_context
      end
    end
  end
end

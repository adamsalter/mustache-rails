module ActionView
  module TemplateHandlers
    class Mustache < TemplateHandler
      include Compilable

      def compile(template)
        view_action_helper =  "%sHelper::%s" % [template.base_path.classify.pluralize, template.name.classify]
        compiled_template = ::Mustache::Template.new(template.source, '.', 'mustache').compile

        template_in_context = <<-EOT
        extend Mustache::Rails::Helper
        extend #{view_action_helper} if defined? #{view_action_helper}
        #{compiled_template}
        EOT
        
        template_in_context
      end
    end
  end
end

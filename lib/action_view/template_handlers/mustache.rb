module ActionView
  module TemplateHandlers
    class Mustache < TemplateHandler
      include Compilable

      def compile(template)
        src = ::Mustache.render("#{template.source}")
      end
    end
  end
end

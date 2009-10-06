module ActionView
  module TemplateHandlers
    class Mustache < TemplateHandler
      include Compilable

      def compile(template)
        src = ::Mustache.new("#{template.source}").to_html
      end
    end
  end
end

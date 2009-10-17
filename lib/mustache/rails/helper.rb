class Mustache
  module Rails
    module Helper
      def context
        @context ||= ::Mustache::Context.new(self)
      end
      def [](key)
        context[key.to_sym]
      end
      def []=(key, value)
        context[key.to_sym] = value
      end
      alias :ctx :context
    end
  end
end
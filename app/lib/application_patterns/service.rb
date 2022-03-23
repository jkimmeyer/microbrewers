module ApplicationPatterns
  class Service
    ServiceCallFailed = Class.new(StandardError)

    class Result
      def initialize(success:, **attributes)
        @success = success

        attributes.each do |name, value|
          raise ArgumentError, "unknown attribute #{name}" unless attribute_readers.include?(name.to_s)

          instance_variable_set("@#{name}", value)
        end
      end

      def success?
        @success
      end

      attr_reader :message

      private

      def attribute_readers
        self.class.instance_methods(false).map(&:to_s) + %w[message]
      end
    end

    def self.call(*args, **kwargs)
      new(*args, **kwargs).call
    end

    def self.call!(*args, **kwargs)
      call(*args, **kwargs).tap do |result|
        raise ServiceCallFailed, "#{self} failed with message #{result.message.inspect}." unless result.success?
      end
    end

    def success(**attributes)
      result_class.new(success: true, **attributes)
    end

    def failure(**attributes)
      result_class.new(success: false, **attributes)
    end

    private

    def result_class
      if self.class.const_defined?(:Result, false)
        self.class.const_get(:Result, false)
      else
        Result
      end
    end
  end
end

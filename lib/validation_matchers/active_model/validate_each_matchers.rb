module ValidationMatchers
  module ActiveModel
    def pass_validate_each(attribute, value)
      PassEachValidationMatcher.new(attribute, value)
    end

    def fail_validate_each(attribute, value)
      FailEachValidationMatcher.new(attribute, value)
    end 

    private

    class Matcher
      def initialize(attribute, value)
        @value = value
        @attribute = attribute
        @record = TestRecord.new(attribute)
      end

      def run_validate_each!(validator)
        @validator = validator
        @validator.validate_each(@record, @attribute, @value)
      end

      def unexpected_errors_ocurred_message
        "expected no validation errors, got #{@record.errors[@attribute].inspect}"
      end

      def expected_errors_to_occur_failure_message
        "expected validation errors"
      end 

      def errors_found?
        !@record.errors[@attribute].empty?
      end
    end

    class PassEachValidationMatcher < Matcher
      def matches?(validator)
        run_validate_each! validator
        !errors_found?
      end
      alias :failure_message            :unexpected_errors_ocurred_message
      alias :negative_failure_message   :expected_errors_to_occur_failure_message
    end
    
    class FailEachValidationMatcher < Matcher
      def matches?(validator)
        run_validate_each! validator
        errors_found?
      end
      alias :failure_message            :expected_errors_to_occur_failure_message
      alias :negative_failure_message   :unexpected_errors_ocurred_message
    end

    class TestRecord
      attr_accessor :errors
      def initialize( attr )
        @errors = {attr => []}
      end
    end
  end
end
# frozen_string_literal: true
module Calculator
  module StringCalculator
    NUMBER_TOO_BIG = 1000

    class << self
      def add(input)
        return 0 if input.strip.empty?
        numbers = extract_numbers(input)
        validate_no_negatives!(numbers)
        numbers.reject { |n| n >= NUMBER_TOO_BIG }.sum
      end

      private

      def extract_numbers(input)
        delimiter, numbers_str = parse_input(input)
        numbers_str.split(delimiter).map(&:to_i)
      end

      def parse_input(input)
        if input.start_with?("//")
          custom_delimiter, numbers_part = input.match(%r{//(.+)\n(.*)}m).captures
          [Regexp.escape(custom_delimiter), numbers_part]
        else
          [/[,\n]/, input]
        end
      end

      def validate_no_negatives!(numbers)
        negatives = numbers.select(&:negative?)
        return if negatives.empty?

        raise "negative numbers not allowed #{negatives.join(',')}"
      end
    end
  end
end

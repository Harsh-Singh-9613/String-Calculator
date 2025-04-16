module Calculator
  class StringCalculator

    def self.add(numbers)
      return 0 if numbers.empty?
    
      delimiter = ",|\n"
      if numbers.start_with?("//")
        delimiter = Regexp.escape(numbers[2])
        numbers = numbers.split("\n", 2).last
      end
    
      numbers.split(/#{delimiter}/).map(&:to_i).sum
    end

  end
end

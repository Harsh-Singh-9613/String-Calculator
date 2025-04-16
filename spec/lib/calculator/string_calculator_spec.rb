require 'rails_helper'

RSpec.describe Calculator::StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(described_class.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      expect(described_class.add("1")).to eq(1)
    end

    it "returns the sum of two comma-separated numbers" do
      expect(described_class.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple comma-separated numbers" do
      expect(described_class.add("1,2,3,4")).to eq(10)
    end

    it "handles newlines between numbers" do
      expect(described_class.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiter" do
      expect(described_class.add("//;\n1;2")).to eq(3)
    end

    it "raises error on negative numbers" do
      expect { described_class.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed -2,-4")
    end
  end
end

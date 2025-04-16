require 'rails_helper'

RSpec.describe Calculator::StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(described_class.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      expect(described_class.add("1")).to eq(1)
    end
  end
end

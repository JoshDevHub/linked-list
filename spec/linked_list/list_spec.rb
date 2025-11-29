require "spec_helper"

require_relative "../../lib/linked_list"

module LinkedList
  RSpec.describe List do
    describe "#head" do
      it "returns the value of the first element in the list" do
        list = described_class.new
        list.prepend(5)
        list.prepend(10)

        expect(list.head).to eq 10
      end

      it "is `nil` for an empty list" do
        list = described_class.new

        expect(list.head).to be_nil
      end
    end

    describe "#tail" do
      it "returns the value of the final element in the list" do
        list = described_class.new
        list.prepend(5)
        list.prepend(10)

        expect(list.tail).to eq 5
      end

      it "is `nil` for an empty list" do
        list = described_class.new

        expect(list.tail).to be_nil
      end
    end
  end
end

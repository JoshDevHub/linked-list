require "spec_helper"

require_relative "../../lib/linked_list"

module LinkedList
  RSpec.describe Node do
    describe "#to_s" do
      it "returns the value as a string" do
        expect(described_class.new(5).to_s).to eq "5"
      end
    end

    describe "#==" do
      it "is equal to a same value node" do
        first_node = described_class.new(5)
        second_node = described_class.new(5)

        expect(first_node).to eq second_node
      end

      it "not equal to a different value node" do
        first_node = described_class.new(5)
        second_node = described_class.new(10)

        expect(first_node).not_to eq second_node
      end
    end

    describe "#tail?" do
      subject(:node) { described_class.new(5, next_node) }

      context "when the node has a `next_node`" do
        let(:next_node) { described_class.new(10) }

        it "is not a tail node" do
          expect(node).not_to be_tail
        end
      end

      context "when the node does not have a `next_node`" do
        let(:next_node) { nil }

        it "is a tail node" do
          expect(node).to be_tail
        end
      end
    end
  end
end

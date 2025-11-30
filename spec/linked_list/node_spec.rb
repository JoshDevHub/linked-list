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
      context "when comparing to another node" do
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

      context "when comparing to some other object" do
        it "does not equal the other object" do
          node = described_class.new(5)
          other_object = "hello there"

          expect(node).not_to eq other_object
        end
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

    describe "#second_successor" do
      it "returns the node's second_successor if it has one" do
        second_successor = described_class.new(30)
        next_node = described_class.new(20, second_successor)
        node = described_class.new(10, next_node)

        expect(node.second_successor).to eq second_successor
      end

      it "is `nil` for a node without a second successor" do
        next_node = described_class.new(20)
        node = described_class.new(10, next_node)

        expect(node.second_successor).to be_nil
      end

      it "is `nil` for a node without a next_node" do
        node = described_class.new(10)
        expect(node.second_successor).to be_nil
      end
    end
  end
end

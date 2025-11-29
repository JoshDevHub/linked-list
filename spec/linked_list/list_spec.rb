require "spec_helper"

require_relative "../../lib/linked_list"

module LinkedList
  RSpec.describe List do
    describe "::from_values" do
      it "constructs a list from a given set of values", :aggregate_failures do
        values = [5, 10, 15, 20]
        list = described_class.from_values(*values)

        expect(list.to_a).to eq values
        expect(list.head).to eq 5
        expect(list.tail).to eq 20
        expect(list.size).to eq 4
      end

      it "returns an empty list when given no values" do
        list = described_class.from_values
        expect(list).to be_empty
      end
    end

    describe "#head" do
      it "returns the value of the first element in the list" do
        list = described_class.from_values(2, 4, 6, 8)

        expect(list.head).to eq 2
      end

      it "is `nil` for an empty list" do
        list = described_class.new

        expect(list.head).to be_nil
      end
    end

    describe "#tail" do
      it "returns the value of the final element in the list" do
        list = described_class.from_values(2, 4, 6, 8)

        expect(list.tail).to eq 8
      end

      it "is `nil` for an empty list" do
        list = described_class.new

        expect(list.tail).to be_nil
      end
    end

    describe "#append" do
      subject(:list) { described_class.from_values(2, 4, 6, 8) }

      it "adds a new item to the end of the list" do
        expect { list.append(10) }.to change(list, :tail).from(8).to(10)
      end

      it "increases the size of the list by one" do
        expect { list.append(10) }.to change(list, :size).from(4).to(5)
      end

      context "with an empty list" do
        subject(:list) { described_class.new }

        it "adds a new item to the beginning of the list" do
          expect { list.append(10) }.to change(list, :head).from(nil).to(10)
        end

        it "adds a new item to the end of the list" do
          expect { list.append(10) }.to change(list, :tail).from(nil).to(10)
        end

        it "increases the size of the list by one" do
          expect { list.append(10) }.to change(list, :size).from(0).to(1)
        end
      end
    end

    describe "#prepend" do
      subject(:list) { described_class.from_values(2, 4, 6, 8) }

      it "adds a new item to the beginning of the list" do
        expect { list.prepend(0) }.to change(list, :head).from(2).to(0)
      end

      it "increases the size of the list by one" do
        expect { list.prepend(0) }.to change(list, :size).from(4).to(5)
      end

      context "with an empty list" do
        subject(:list) { described_class.new }

        it "adds a new item to the beginning of the list" do
          expect { list.append(10) }.to change(list, :head).from(nil).to(10)
        end

        it "adds a new item to the end of the list" do
          expect { list.append(10) }.to change(list, :tail).from(nil).to(10)
        end

        it "increases the size of the list by one" do
          expect { list.append(10) }.to change(list, :size).from(0).to(1)
        end
      end
    end

    describe "#at" do
      subject(:list) { described_class.from_values(2, 4, 6, 8) }

      it "returns the value at a given index", :aggregate_failures do
        expect(list.at(0)).to eq 2
        expect(list.at(1)).to eq 4
        expect(list.at(2)).to eq 6
        expect(list.at(3)).to eq 8
      end

      it "is `nil` for a negative index" do
        expect(list.at(-1)).to be_nil
      end

      it "is `nil` for an index above the list's length" do
        expect(list.at(5)).to be_nil
      end
    end
  end
end

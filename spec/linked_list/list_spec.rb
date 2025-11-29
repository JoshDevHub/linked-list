require "spec_helper"

require_relative "../../lib/linked_list"

module LinkedList
  RSpec.describe List do
    describe "::from_values" do
      it "constructs a list from a given set of values", :aggregate_failures do
        values = [5, 10, 15, 20]
        list = described_class.from_values(*values)

        expect(list.head).to eq 5
        expect(list.tail).to eq 20
        expect(list.at(1)).to eq 10
        expect(list.at(2)).to eq 15
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

    describe "#pop" do
      subject(:list) { described_class.from_values(2, 4, 6, 8) }

      it "returns the original head's value" do
        expect(list.pop).to eq 2
      end

      it "changes the current head to the original head's next node" do
        expect { list.pop }.to change(list, :head).from(2).to(4)
      end

      it "decreases the size of the list by one" do
        expect { list.pop }.to change(list, :size).from(4).to(3)
      end

      context "with an empty list" do
        subject(:list) { described_class.new }

        it "returns `nil`" do
          expect(list.pop).to be_nil
        end

        it "does not change the size" do
          expect { list.pop }.not_to change(list, :size)
        end
      end
    end

    describe "#contains?" do
      subject(:list) { described_class.from_values(1, 2, 3) }

      it "returns true if the element is in the list", :aggregate_failures do
        expect(list.contains?(1)).to be true
        expect(list.contains?(2)).to be true
        expect(list.contains?(3)).to be true
      end

      it "returns false if the element is not in the list", :aggregate_failures do
        expect(list.contains?(0)).to be false
        expect(list.contains?(-1)).to be false
        expect(list.contains?(4)).to be false
      end
    end

    describe "#find" do
      subject(:list) { described_class.from_values(5, 10, 15) }

      it "returns the value's index for a value that's in the list", :aggregate_failures do
        expect(list.find(5)).to eq 0
        expect(list.find(10)).to eq 1
        expect(list.find(15)).to eq 2
      end

      it "is `nil` for any value not in the list", :aggregate_failures do
        expect(list.find(6)).to be_nil
        expect(list.find(16)).to be_nil
      end
    end
  end
end

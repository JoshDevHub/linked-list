# frozen_string_literal: true

class LinkedList
  class Node
    attr_reader :value
    attr_accessor :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end

    def to_s = value.to_s
  end
end

# frozen_string_literal: true

# class for Nodes contained within a LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def ==(other)
    value == other.value
  end

  def to_s
    value.to_s
  end
end

# frozen_string_literal: true

# class for Nodes contained within a LinkedList
Node = Struct.new(:value, :next_node) do
  def initialize(value: nil, next_node: nil)
    super(value, next_node)
  end

  def to_s
    value.to_s
  end
end

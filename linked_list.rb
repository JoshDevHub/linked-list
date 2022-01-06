# frozen_string_literal: true

require_relative 'node'

require 'pry-byebug'

# class to represent a linked list data structure
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_tail = Node.new(value)
    if head.nil?
      self.head = new_tail
    else
      pointer = head
      pointer = pointer.next_node until pointer.next_node.nil?
      pointer.next_node = new_tail
    end
  end

  def prepend(value)
    self.head = head.nil? ? Node.new(value) : Node.new(value, head)
  end
end

# tests
my_list = LinkedList.new
my_list.append(5)
my_list.append(10)
my_list.append(15)
my_list.prepend(1)
p my_list.head

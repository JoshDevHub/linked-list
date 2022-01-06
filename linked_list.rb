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
      current_pointer.next_node = new_tail
    end
  end
end

# tests
my_list = LinkedList.new
my_list.append(5)
p my_list.head
my_list.append(10)
p my_list.head
my_list.append(15)
p my_list.head

# frozen_string_literal: true

require_relative 'node'

require 'pry-byebug'

# class to represent a linked list data structure
class LinkedList
  attr_accessor :list

  def initialize
    @list = nil
  end

  def append(value)
    new_tail = Node.new(value)
    if list.nil?
      self.list = new_tail
    else
      pointer = list
      pointer = pointer.next_node until pointer.next_node.nil?
      pointer.next_node = new_tail
    end
  end

  def prepend(value)
    self.list = list.nil? ? Node.new(value) : Node.new(value, list)
  end

  def size
    return 0 if list.nil?

    counter = 1
    pointer = list
    until pointer.next_node.nil?
      counter += 1
      pointer = pointer.next_node
    end
    counter
  end

  def head
    list.nil? ? nil : list.value
  end

  def tail
    return nil if list.nil?

    pointer = list
    pointer = pointer.next_node until pointer.next_node.nil?
    pointer.value
  end
end

# tests
my_list = LinkedList.new
my_list.append(5)
my_list.append(10)
my_list.append(15)
my_list.prepend(1)
p my_list.head

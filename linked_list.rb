# frozen_string_literal: true

require_relative 'node'

require 'pry-byebug'

# class to represent a linked list data structure
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if head.nil?
      self.tail = new_node
    else
      new_node.next_node = head
    end
    self.head = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    if head.nil?
      self.head = new_node
    else
      tail.next_node = new_node
    end
    self.tail = new_node
  end

  def size
    return 0 if head.nil?

    counter = 1
    pointer = head
    until pointer == tail
      counter += 1
      pointer = pointer.next_node
    end
    counter
  end

  def at(index)
    return 'OOPS' if index.negative?

    pointer = head
    counter = 0
    until counter == index
      break if pointer.nil?

      pointer = pointer.next_node
      counter += 1
    end
    pointer.nil? ? nil : pointer
  end

  def pop
    if head == tail
      self.head = nil
      self.tail = nil
    else
      pointer = head
      pointer = pointer.next_node until pointer.next_node == tail
      pointer.next_node = nil
      self.tail = pointer
    end
  end
end

# tests
my_list = LinkedList.new
# my_list.append(5)
# my_list.append(10)
# my_list.append(15)
# my_list.prepend(1)
my_list.pop
p my_list.head

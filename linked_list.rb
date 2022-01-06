# frozen_string_literal: true

require_relative 'node'

require 'pry-byebug'

# rubocop: disable Metrics/ClassLength

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

  def each
    return nil if head.nil?

    pointer = head
    until pointer.nil?
      yield pointer
      pointer = pointer.next_node
    end
  end

  def size
    return 0 if head.nil?

    counter = 0
    each { |_element| counter += 1 }
    counter
  end

  def at(index)
    return nil if index.negative?

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

  def contains?(value)
    return false if head.nil?

    pointer = head
    until pointer == tail
      break if pointer.value == value

      pointer = pointer.next_node
    end
    pointer.value == value
  end

  def find(value)
    return nil if head.nil?

    pointer = head
    index = 0
    until pointer == tail
      break if pointer.value == value

      pointer = pointer.next_node
      index += 1
    end
    pointer.value == value ? index : nil
  end

  def to_s
    return nil if head.nil?

    list_string = ''
    pointer = head
    until pointer.nil?
      list_string += "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    "#{list_string} nil"
  end

  def insert_at(value, index)
    if index.zero?
      append(value)
    elsif index == size
      prepend(value)
    else
      return nil if at(index).nil?

      new_node = Node.new(value, at(index))
      at(index - 1).next_node = new_node
      at(index).next_node = at(index + 1)
    end
  end

  def remove_at(index)
    if index == size
      pop
    elsif at(index).nil?
      nil
    else
      prev_node = at(index - 1)
      next_node = at(index + 1)
      prev_node.nil? ? self.head = next_node : prev_node.next_node = next_node
    end
  end
end

# tests
my_list = LinkedList.new
# my_list.append(5)
# my_list.append(10)
# my_list.append(15)
# my_list.prepend(1)
# my_list.remove_at(5)
p my_list.size
p my_list.test_size

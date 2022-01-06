# frozen_string_literal: true

require_relative 'node'

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
    return nil if index.negative? || index + 1 > size

    counter = 0
    return_element = nil
    each do |element|
      return_element = element if index == counter
      break if return_element

      counter += 1
    end
    return_element
  end

  def pop
    if head == tail
      self.head = nil
      self.tail = nil
    else
      new_tail = nil
      each { |element| new_tail = element if element.next_node == tail }
      new_tail.next_node = nil
      self.tail = new_tail
    end
  end

  def contains?(value)
    return false if head.nil?

    return_bool = false
    each { |element| return_bool = true if element.value == value }
    return_bool
  end

  def find(value)
    return nil if head.nil?

    return_index = nil
    index = 0
    each do |element|
      return_index = index if element.value == value
      index += 1
    end
    return_index
  end

  def to_s
    return nil if head.nil?

    list_string = ''
    each { |element| list_string += "( #{element.value} ) -> " }
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

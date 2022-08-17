# frozen_string_literal: true

require_relative 'node'

# class to represent a linked list data structure
class LinkedList
  include Enumerable

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

  def each(&block)
    return nil if head.nil?

    pointer = head
    until pointer.nil?
      block.call(pointer)
      pointer = pointer.next_node
    end
  end

  def size
    count
  end

  def at(index)
    each_with_index { |node, step| return node if step == index }
    nil
  end

  def pop
    if head == tail
      self.head = nil
      self.tail = nil
    else
      new_tail = find { |node| node.next_node == tail }
      new_tail.next_node = nil
      self.tail = new_tail
    end
  end

  def contains?(value)
    include?(Node.new(value))
  end

  def to_s
    reduce(+'') do |list_string, node|
      trailing_string = node.next_node.nil? ? 'nil' : ''
      "#{list_string}( #{node} ) -> #{trailing_string}"
    end
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

# frozen_string_literal: true

require_relative 'node'

require 'pry-byebug'

# class to represent a linked list data structure
class LinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def append(value)
    old_end = list[-1]
    new_end = Node.new(value)
    old_end.next_node = new_end.value unless old_end.nil?
    list << new_end
  end

  def prepend(value)
    old_head = list[0]
    new_head = if old_head.nil?
                 Node.new(value)
               else
                 Node.new(value, old_head.value)
               end
    list.unshift(new_head)
  end
end

# tests
my_list = LinkedList.new

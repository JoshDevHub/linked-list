module LinkedList
  class List
    def self.from_values(*values)
      list = new
      values.reverse_each { |value| list.prepend(value) }

      list
    end

    def initialize
      @head = nil
    end

    def head = @head&.value

    def tail = tail_node&.value

    def empty? = @head.nil?

    def append(value)
      new_node = Node.new(value)
      if empty?
        @head = new_node
        return
      end

      tail_node.next_node = new_node
    end

    def prepend(value)
      new_node = Node.new(value, @head)
      @head = new_node
    end

    def size = each_node.count

    def at(index) = node_by_index(index)&.value

    def pop
      return if empty?

      out = @head.value
      @head = @head.next_node
      out
    end

    def contains?(value)
      each_node.any? { value == it.value }
    end

    def index(value)
      each_node.find_index { value == it.value }
    end

    def to_s
      return "" if empty?

      "#{each_node.to_a.join}nil"
    end

    def insert_at(index, *values)
      raise IndexError if index.negative? || index > size

      if index.zero?
        values.reverse_each { prepend(it) }
        return
      end

      prev_node = node_by_index(index - 1)
      until values.empty?
        new_node = Node.new(values.pop, prev_node.next_node)
        prev_node.next_node = new_node
      end
    end

    def remove_at(index)
      raise IndexError if index.negative? || index >= size

      pop and return if index.zero?

      prev_node = node_by_index(index - 1)
      next_node = prev_node.second_successor
      prev_node.next_node = next_node
    end

    private

    def each_node
      return to_enum(:each_node) unless block_given?

      pointer = @head

      while pointer
        yield pointer
        pointer = pointer.next_node
      end

      self
    end

    def node_by_index(index)
      each_node
        .with_index
        .find(proc { [] }) { |_, idx| index == idx }
        .first
    end

    def tail_node = each_node.find(&:tail?)
  end
end

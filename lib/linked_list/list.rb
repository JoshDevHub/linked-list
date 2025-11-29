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

    def find(value)
      each_node.find_index { value == it.value }
    end

    def to_s
      list_string = each_node.map { |node| "( #{node} ) -> " }.join
      "#{list_string}nil"
    end

    def insert_at(value, index)
      return if index.negative? || index > size

      if index.zero?
        prepend(value)
      else
        prev_node = node_by_index(index - 1)
        next_node = prev_node.next_node
        prev_node.next_node = Node.new(value, next_node)
      end
    end

    def remove_at(index)
      return if index.negative? || index > size

      if index == size
        pop
      else
        prev_node = at(index - 1)
        next_node = prev_node&.next_node&.next_node
        prev_node ? self.head = next_node : prev_node.next_node = next_node
      end
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

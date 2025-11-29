module LinkedList
  class List
    attr_reader :size

    def self.from_values(*values)
      list = new
      values.reverse_each { |value| list.prepend(value) }

      list
    end

    def initialize
      @head = nil
      @size = 0
    end

    def head = @head&.value

    def tail = tail_node&.value

    def empty? = @head.nil?

    def append(value)
      increase_size

      new_node = Node.new(value)
      if empty?
        @head = new_node
        return
      end

      tail_node.next_node = new_node
    end

    def prepend(value)
      increase_size

      new_node = Node.new(value, @head)
      @head = new_node
    end

    def at(index)
      each_node.with_index { |node, idx| return node.value if idx == index }
      nil
    end

    def pop
      return if empty?

      out = @head.value
      @head = @head.next_node

      decrease_size
      out
    end

    def contains?(value)
      each_node.any? { value == it.value }
    end

    def to_s
      reduce(+"") do |list_string, node|
        trailing_string = node.next_node.nil? ? "nil" : ""
        "#{list_string}( #{node} ) -> #{trailing_string}"
      end
    end

    def insert_at(value, index)
      return if index.negative? || index > size

      if index.zero?
        append(value)
      elsif index == size
        prepend(value)
      else
        @size += 1
        prev_node = at(index - 1)
        next_node = prev_node.next_node
        prev_node.next_node = Node.new(value:, next_node:)
      end
    end

    def remove_at(index)
      return if index.negative? || index > size

      if index == size
        pop
      else
        @size -= 1
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

    def increase_size = @size += 1
    def decrease_size = @size -= 1

    def tail_node = each_node.find(&:tail?)
  end
end

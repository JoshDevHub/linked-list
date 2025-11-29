module LinkedList
  class List
    include Enumerable

    attr_accessor :size

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

    def each
      return to_enum(:each) unless block_given?

      pointer = @head
      until pointer.nil?
        yield(pointer.value)
        pointer = pointer.next_node
      end

      self
    end

    def at(index)
      each_with_index { |value, i| return value if i == index }
      nil
    end

    def pop
      @size -= 1

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
      any? { |node| node.value == value }
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

    def increase_size = @size += 1
    def decrease_size = @size -= 1

    def tail_node
      return if empty?

      pointer = @head
      pointer = pointer.next_node until pointer.tail?
      pointer
    end
  end
end

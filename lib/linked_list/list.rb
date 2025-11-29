module LinkedList
  class List
    include Enumerable

    attr_accessor :size
    attr_writer :head, :tail

    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end

    def head = @head&.value

    def tail
      return if @head.nil?

      pointer = @head
      pointer = pointer.next_node until pointer.tail?

      pointer.value
    end

    def append(value)
      increase_size

      new_node = Node.new(value)
      if empty?
        @head = new_node
      else
        tail.next_node = new_node
      end
      self.tail = new_node
    end

    def prepend(value)
      @size += 1

      new_node = Node.new(value)
      if empty?
        self.tail = new_node
      else
        new_node.next_node = @head
      end
      self.head = new_node
    end

    def each(&block)
      return nil if head.nil?

      pointer = head
      until pointer.nil?
        block.call(pointer)
        pointer = pointer.next_node
      end
    end

    def at(index)
      each_with_index { |node, i| return node if i == index }
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

    def empty?
      @head.nil?
    end

    def increase_size = @size += 1
  end
end

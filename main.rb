class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    last_node = @head
    if last_node.nil?
      @head = new_node
    else
      last_node = last_node.next_node until last_node.next_node.nil?
      last_node.next_node = new_node
    end
    self
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
    self
  end

  def size
    size = 0
    current_node = @head
    until current_node.nil?
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def tail
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node.value
  end

  def at(index)
    return nil if index.negative?

    current_node = @head
    index.times do
      return nil if current_node.nil?

      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      popped_node = @head
      @head = nil
    else
      penultimum_node = @head
      penultimum_node = penultimum_node.next_node until penultimum_node.next_node.next_node.nil?
      popped_node = penultimum_node.next_node
      penultimum_node.next_node = nil
    end
    popped_node.value
  end

  def contains?(value)
    current_node = @head
    loop do
      return false if current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
  end

  def find(value)
    current_node = @head
    index = 0
    loop do
      return nil if current_node.nil?
      return index if current_node.value == value

      index += 1
      current_node = current_node.next_node
    end
  end

  def to_s
    str = ''
    current_node = @head
    until current_node.nil?
      str += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    str + 'nil'
  end

  def insert_at(value, index)
    return nil if index.negative?
    return prepend(value) if index.zero?

    difference = index - size
    difference.times { append nil } if difference > 0
    prev_node = at(index - 1)
    new_node = Node.new(value, prev_node.next_node)
    prev_node.next_node = new_node
    self
  end

  def remove_at(index)
    return nil if @head.nil? || index < 0

    if index.zero?
      rm_node = @head
      @head = @head.next_node
    else
      prev_node = at(index - 1)
      return nil if prev_node.nil? || prev_node.next_node.next_node.nil?

      rm_node = prev_node.next_node
      prev_node.next_node = rm_node.next_node
    end
    rm_node.value
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

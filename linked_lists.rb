class LinkedList
  def initialize(data, next_node = nil)
    @head = Node.new(data)
  end

  def append(data)
    position = @head
    while position.next_node != nil
      position = position.next_node
    end
    position.next_node = Node.new(data)
  end

  def prepend(data)
    position = @head
    @head = Node.new(data, position)
  end

  def insert_at(data, index)
    position = @head
    a = 1
    while a < index
      position = position.next_node
      a += 1
    end
    position.next_node = Node.new(data, position.next_node)
  end

  def remove_at(index)
    position = @head
    a = 1
    while a < index
      position = position.next_node
      a += 1
    end
    position.next_node = position.next_node.next_node
  end

  def size
    @size = 1
    position = @head
    while position.next_node != nil
      position = position.next_node
      @size += 1
    end
    p @size
  end

  def head
    puts @head.data
  end

  def tail
    position = @head
    while position.next_node != nil
      position = position.next_node
    end
    puts position.data
  end

  def at(index)
    position = @head
    a = 0
    while a < index
      position = position.next_node
      a += 1
    end 
    puts position.data
  end

  def pop
    position = @head
    a = 1
    while a < @size - 1
      position = position.next_node
      a += 1
    end 
    position.next_node = nil
  end

  def contains?(value)
    position = @head
    while position.next_node != nil && position.data != value
      position = position.next_node
    end

    if position.data == value
      p true 
    else
      p false
    end
  end

  def find(value)
    position = @head
    a = 0
    while position.next_node != nil && position.data != value
      position = position.next_node
      a += 1
    end

    if position.data == value
      p a
    else
      p nil
    end
  end

  def to_s
    list = ''
    position = @head
    until position.next_node == nil
      list << "( #{position.data} ) => "
      position = position.next_node
    end

    list << "( #{position.data} ) => "
    list << "nil"

    p list
  end
end

class Node
  attr_reader :data
  attr_accessor :next_node
  
  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end
end


list = LinkedList.new(1423)

list.append(12)
list.prepend(14)
list.append('LoveRuby')
list.insert_at('X', 2)
list.remove_at(2)

list.to_s
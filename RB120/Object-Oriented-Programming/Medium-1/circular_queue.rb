class CircularQueue

  def initialize(capacity)
    self.buffer = Array.new(capacity)
    self.i_head = 0 # oldest position, where we deQueue from
    self.i_tail = i_head # next position, where we Queue onto
  end

  def enqueue(entry)
    increment_head unless tail.nil? # check if we overwrite entry
    buffer[i_tail] = entry
    increment_tail
  end

  def dequeue
    current_head_object = head

    unless current_head_object.nil?
      buffer[i_head] = nil
      increment_head
    end

    current_head_object
  end

  private

  attr_accessor :buffer, :i_head, :i_tail

  def head
    buffer[i_head]
  end

  def tail
    buffer[i_tail]
  end

  def increment_head
    self.i_head = increment_and_wrap(i_head)
  end

  def increment_tail
    self.i_tail = increment_and_wrap(i_tail)
  end

  def increment_and_wrap(index)
    (index + 1) % buffer.size
  end

end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
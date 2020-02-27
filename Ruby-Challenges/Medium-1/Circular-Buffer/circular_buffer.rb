class CircularBuffer
  class BufferEmptyException < RuntimeError; end
  class BufferFullException < RuntimeError; end

  def initialize(capacity)
    reset(capacity)
  end

  def clear
    reset(capacity)
  end

  def read
    raise BufferEmptyException if empty?

    oldest = oldest_value
    replace_oldest(nil)
    decrement_count

    increment_oldest

    oldest
  end

  def write!(element)
    return if element.nil?

    replace_next(element)
    increment_next

    if full?
      increment_oldest
    else
      increment_count
    end
  end

  def write(element)
    raise BufferFullException if full?

    write!(element)
  end

  private

  def wrap_index(index)
    index % capacity
  end

  def increment_next
    self.next_index = wrap_index(next_index + 1)
  end

  def increment_oldest
    self.oldest_index = wrap_index(oldest_index + 1)
  end

  def increment_count
    self.count = count + 1
  end

  def decrement_count
    self.count = count - 1
  end

  def reset(new_capacity)
    self.count = 0
    self.oldest_index = 0
    self.next_index = 0
    reset_buffer(new_capacity)
  end

  def reset_buffer(new_capacity)
    if buffer
      buffer.map! { |_| nil }
    else
      self.buffer = Array.new(new_capacity)
    end
  end

  def capacity
    buffer.size
  end

  def full?
    count == capacity
  end

  def empty?
    count == 0
  end

  def replace_oldest(element)
    buffer[oldest_index] = element
  end

  def replace_next(element)
    buffer[next_index] = element
  end

  def oldest_value
    buffer[oldest_index]
  end

  attr_accessor(:count, :oldest_index, :next_index, :buffer)
end

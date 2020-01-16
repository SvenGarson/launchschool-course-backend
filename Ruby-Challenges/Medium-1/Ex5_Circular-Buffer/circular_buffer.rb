class CircularBuffer

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(max_capacity)
    self.buffer = Array.new(max_capacity)  
    clear
  end

  def clear
    self.start_index = 0
    self.end_index = 0
    self.item_count = 0
    buffer.map!{ |_| nil}
  end

  def write(item)
    if full?
      raise BufferFullException
    else
      write!(item)
    end
  end

  def write!(item)
    return if item.nil?
  
    increment_start if data_at?(end_index)

    buffer[end_index] = item
    item_written
    increment_end
  end

  def read
    if empty?
      raise BufferEmptyException
    else
      data = buffer[start_index]
      buffer[start_index] = nil
      item_read
      increment_start
      data
    end
  end

  private 
  
  attr_accessor :start_index, :end_index, :item_count, :buffer

  def data_at?(index)
    !buffer[index].nil?
  end

  def item_written
    next_item_count = item_count + 1
    self.item_count = next_item_count > capacity ? capacity : next_item_count
  end

  def item_read
    next_item_count = item_count - 1
    self.item_count = next_item_count < 0 ? 0 : next_item_count
  end

  def full?
    item_count >= capacity
  end

  def empty?
    item_count <= 0
  end

  def capacity
    buffer.length
  end

  def increment_start
    self.start_index = increment_index(start_index)
  end

  def increment_end
    self.end_index = increment_index(end_index)
  end

  def increment_index(current_index)
    (current_index + 1) % capacity
  end

end
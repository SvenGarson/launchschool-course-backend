class Element
  def initialize(data, next_element = nil)
    self.data = data
    self.next_element = next_element
  end

  def datum
    data
  end

  def next
    next_element
  end

  def tail?
    next_element.nil?
  end

  private
  
  attr_accessor(:data, :next_element)
end

class SimpleLinkedList
  attr_reader(:size, :head)

  def initialize
    self.size = 0
    self.head = nil
  end

  def peek
    head ? head.datum : nil
  end

  def pop
    if head.nil?
      nil
    else
      datum = head.datum
      self.head = head.next
      self.size = size - 1
      datum
    end
  end

  def push(element_data)
    # grow towards head
    next_element = Element.new(element_data, head)

    self.size = size + 1
    self.head = next_element
  end

  def empty?
    size == 0
  end

  def self.from_a(list)
    new_list = SimpleLinkedList.new
    
    # guard against nil and empty list
    return new_list if (list.nil? || list.empty?)

    list.reverse_each do |list_datum|
      new_list.push(list_datum)
    end

    new_list
  end

  def to_a
    datum_list = Array.new
    return datum_list if self.empty?

    gather_element_data
  end

  def reverse
    current_reversed = to_a.reverse
    self.class.from_a(current_reversed)
  end
  
  private

  def gather_element_data
    gathered_data = Array.new
  
    current = head
    until current.nil?
      gathered_data << current.datum
      current = current.next
    end

    gathered_data
  end

  attr_writer(:size, :head)
end
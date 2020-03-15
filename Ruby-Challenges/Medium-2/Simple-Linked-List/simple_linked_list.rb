class Element
  attr_reader(:datum, :next)
  attr_writer(:next)

  def initialize(data, next_element = nil)
    self.datum = data
    self.next = next_element
  end

  def tail?
    self.next.nil?
  end

  private

  attr_writer(:datum)
end

class SimpleLinkedList
  attr_reader(:head, :size)

  def initialize
    self.head = nil
    self.size = 0
  end

  def peek
    head ? head.datum : nil
  end

  def push(data)
    if empty?
      self.head = Element.new(data)
    else
      old_head = head
      self.head = Element.new(data, old_head)
    end

    self.size = size + 1
  end

  def pop
    head_datum = head.datum
    self.head = head.next

    self.size = size > 0 ? size - 1 : 0
    head_datum
  end

  def empty?
    size == 0
  end

  def to_a
    gathered_element_datums = Array.new

    current_element = head

    size.times do |_|
      gathered_element_datums << current_element.datum

      current_element = current_element.next
    end

    gathered_element_datums
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  def self.from_a(data_array)
    data_array = data_array.nil? ? [] : data_array

    linked_list = SimpleLinkedList.new

    data_array.reverse.each do |data|
      linked_list.push(data)
    end

    linked_list
  end

  private

  attr_writer(:head, :size)
end

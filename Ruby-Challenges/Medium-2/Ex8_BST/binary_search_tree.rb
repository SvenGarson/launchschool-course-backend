class Bst

  attr_reader(:data, :left, :right)

  def initialize(initial_data)
    self.data = initial_data
  end

  def insert(insert_data)
    if insert_data <= data
      if left.nil?
        self.left = Bst.new(insert_data)
      else
        left.insert(insert_data)
      end
    else
      if right.nil?
        self.right = Bst.new(insert_data)
      else
        right.insert(insert_data)
      end
    end    
  end

  def each
    if block_given?
      self.each.each do |data|
        yield(data)
      end
    else
      Enumerator.new do |yielder|
        gather_ordered_data.each do |data|
          yielder << data
        end
      end
    end
  end

  def gather_ordered_data
    gathered_data = Array.new
    gathered_data.concat(left.gather_ordered_data) if left
    gathered_data << data
    gathered_data.concat(right.gather_ordered_data) if right
    gathered_data
  end

  attr_writer(:data, :left, :right)
end
class Bst
  attr_reader(:data, :left, :right)

  def initialize(data)
    self.data = data
    self.left = nil
    self.right = nil
  end

  def insert(new_data)
    if new_data <= data
      if left
        left.insert(new_data)
      else
        self.left = Bst.new(new_data)
      end
    elsif right
      right.insert(new_data)
    else
      self.right = Bst.new(new_data)
    end
  end

  def each
    gathered_data = Array.new
    gather_data_ascending_order(gathered_data)

    if block_given?
      gathered_data.each { |data| yield(data) }
    else
      Enumerator.new do |yielder|
        gathered_data.each { |data| yielder << data }
      end
    end
  end

  protected

  def gather_data_ascending_order(accumulator)
    left&.gather_data_ascending_order(accumulator)
    accumulator << data
    right&.gather_data_ascending_order(accumulator)
  end

  private

  attr_writer(:data, :left, :right)
end

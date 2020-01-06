class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def concat(other_list)
    todos.concat(other_list)
  end

  def add(todo)
    if todo.instance_of?(Todo)
      todos << todo
    else
      raise TypeError.new('Can only add Todo objects')
    end
  end

  def <<(todo)
    add(todo)
  end

  def size
    todos.length
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.dup
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    result = todos.delete_at(index)
    if result.nil?
      raise IndexError
    else
      result
    end
  end

  def to_s
    todo_lines = []
    todo_lines << "---- #{title} ----"
    todos.each { |todo| todo_lines << todo.to_s }
    todo_lines.join("\n")
  end
  
  def each
    index = 0
    todos.each { |todo| yield(todo) }
    self
  end

  def select
    selection = TodoList.new(title)
    each do |todo|
      selection << todo if yield(todo)
    end
    selection
  end  

  private
  
  attr_reader(:todos)

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect
puts (results.class == TodoList) && (results.object_id != list.object_id)
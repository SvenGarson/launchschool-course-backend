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
  
  private
  
  attr_reader(:todos)

end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list << todo3
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# ---- Interrogating the list -----

# size
p list.size == 3

# first
p list.first == todo1

# last
p list.last == todo3

#to_a
puts "#### Complete list ####"
puts list.to_a
puts "#######################"

#done?
p list.done? == false

# ---- Retrieving an item in the list ----

# item_at
#list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
#list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

# mark_undone_at
#list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
list.shift                      # removes and returns the first item in list

# pop
#list.pop                        # removes and returns the last item in list

# remove_at
#list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
#list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
puts list.to_s                      # returns string representation of the list
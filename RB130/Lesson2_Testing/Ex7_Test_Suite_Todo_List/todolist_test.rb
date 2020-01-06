require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative 'todolist'

class TodoListTest < MiniTest::Test

  private

  attr_reader :todo1, :todo2, :todo3, :todos, :list

  public

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    value_to_a = list.to_a
    assert_equal(todos, value_to_a)
    assert(!value_to_a.eql?(todos.object_id))
  end

  def test_size
    assert_equal(3, list.size)
  end

  def test_first
    assert_equal(todo1, list.first)
  end

  def test_last
    assert_equal(todo3, list.last)
  end

  def test_shift
    assert_equal(todo1, list.shift)
    assert_equal(2, list.size)
  end

  def test_pop
    assert_equal(todo3, list.pop)
    assert_equal(2, list.size)
  end

  def test_done?
    # check if all todos are done
    list.done!
    assert_equal(true, list.to_a.all? { |todo| todo.done? })
  end

  def test_add
    # check TypeError
    assert_raises(TypeError) { list.add(String.new) }

    # check if Todo object is actually added to list
    list.add(Todo.new('Buy fishfood'))
    assert_equal(4, list.size)
  end

  def test_add_shovel
    # check TypeError
    assert_raises(TypeError) { list << String.new }

    # check if Todo object is actually added to list
    list << Todo.new('Buy fishfood')
    assert_equal(4, list.size)
  end

  def test_item_at
    # index error if out of bounds
    assert_raises(IndexError) { list.item_at(6) }
    
    # check if correct item returned for index
    assert_equal(todo1, list.item_at(0))
    assert_equal(todo2, list.item_at(1))
    assert_equal(todo3, list.item_at(2))
  end

  def test_mark_done_at
    # index error if out of bounds
    assert_raises(IndexError) { list.mark_done_at(6) }

    # check if todo actually marked done
    assert_equal(false, list.item_at(1).done?)
    list.mark_done_at(1)
    assert_equal(true, list.item_at(1).done?)
  end

  def test_mark_undone_at
    # index error if out of bounds
    assert_raises(IndexError) { list.mark_undone_at(6) }

    # check if todo actually un-done
    list.mark_done_at(1)
    assert_equal(true, list.item_at(1).done?)
    list.mark_undone_at(1)
    assert_equal(false, list.item_at(1).done?)
  end

  def test_done!
    # check if all todo's done
    assert_equal(false, list.to_a.all? { |todo| todo.done? })
    list.done!
    assert_equal(true, list.to_a.all? { |todo| todo.done? })
  end

  def test_remove_at
    # index error if out of bounds
    assert_raises(IndexError) { list.remove_at(6) }

    # check todo at index object actually removed
    # and correct Todo object returned
    assert_equal(todo3, list.remove_at(2))
    assert_equal(2, list.size)
  end

  def test_to_s
    # check for first string as title in format '---- TITLE ----'
    splits = list.to_s.split("\n")
    title_string = splits.first
    assert_equal(true,
                 title_string.start_with?('----') && title_string.end_with?('----')
                )
    # successive strings start with [] or [X]
    assert_equal(true,
                 splits[1..-1].all? do |todo_string|
                   todo_string.start_with?('[ ] ', '[X] ')
                 end
                )
    # total count of string is 1 (title) + todos in list
    assert_equal(true, splits[1..-1].length == list.size)
  end

  def test_each
    iterated = Array.new
    list.each { |todo| iterated << todo }
    assert_equal(list.to_a, iterated)
  end

  def test_each_return_value
    each_return_value = list.each { |_| nil }
    assert_same(list, each_return_value)
  end

  def test_select
    # returns a TodoList object
    assert_instance_of(TodoList, list.select { |_| nil })

    # selects based on criteria
    list.mark_done_at(1)
    marked = list.select { |todo| todo.done? }
    unmarked = list.select { |todo| !todo.done? }
    assert_equal(true, marked.to_a == [todo2])
    assert_equal(true, unmarked.to_a == [todo1, todo3])
  end

end
class Book

  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin

  Further exploration
  -------------------

  This way of initializing an object is cumbersome in this
  case, since a book will always have an author and a title.
  So simply initializing the book object by passing the

  constuctor both the tiitle and author will make this operation
  much simpler, quicker to write and less prone to situations 
  like for instance, forgetting to set the author.

  If we forget to initialize/set one of these instance variables,
  and the class implementation details that is based on these
  instance variables, we would have to gracefully handle any
  oddities by handling possible many and weird edge cases.
=end
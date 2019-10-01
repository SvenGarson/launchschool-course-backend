class Book

  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin

  Further exploration
  -------------------

  We use attr_reader simply because that is all we need.
  If this is all the functionality we need, we should not
  enable users of the code to change the internal state of
  a book object, which would be the case for either 
  attr_writer and attr_accessor.

  The only advantage of explicitly defining an implementation
  for the title and author setter methods, is in case we need
  to somehow validate or change the pased in object before
  storing it in the class instance variables.

=end
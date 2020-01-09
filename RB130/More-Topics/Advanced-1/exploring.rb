# Group 1
puts "----------------- Group 1 -----------------"
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

=begin

  # observation group 1
  ---------------------

  First we create a proc object by implicitly invoking
  the Proc.new methods through Kernel#proc and pass it
  an executable block that takes one parameter.

  We then output the block object itself, the class of
  the object, which is Proc, that invoke the block without
  providing an argument to the block.

  So the first invocation does not print a name and since
  nil.to_s does returns an exmpty string we can't see that
  the block parameter is not bound to anything.

  Secondly, we do provide a block argument, which is why for
  that invocation we do see the name provided to the block.   

=end

# Group 2
puts "----------------- Group 2 -----------------"
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
#my_lambda.call
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin

  # observation group 2
  ---------------------

  A lambda seems to be an instance of a Proc, but is less
  lenient about the block parameterrs.
  Lambdas seem to throw errors on erroneous arguments,
  similar to normal methods.

  Also Lambda does not seem to be a class, so a lambda is
  a kind of Proc and not it's own type of object.
  
=end

# Group 3
puts "----------------- Group 3 -----------------"
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
#block_method_1('seal')

=begin

  # observation group 3
  ---------------------

  A method can yield a provided block without passing it
  the arguments listed in the block definition, but if a
  methods yields a block, and no block was passed, Ruby
  raises a LocalJumpError.

=end

# Group 4
puts "----------------- Group 4 -----------------"
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}


=begin

  # observation group 4
  ---------------------

  The last example fails because no local variable names
  'animal' is in scope, which is why Ruby raises a NameError.

=end

=begin

  # Final analysis
  ----------------

  A Lambda is it's own kind of object, but it is based on
  the Proc class. There is a difference in Arity, i.e, how
  the different objects/entities: Procs, Lambdas and Blocks
  enforce (or not) the argument list, if there is an error
  thrown or how missing and present arguments are evaluated.

=end
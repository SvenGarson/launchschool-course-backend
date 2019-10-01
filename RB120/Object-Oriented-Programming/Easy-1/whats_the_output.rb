class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase
    "My name is #{@name}."
  end
end

puts '=== Solution using non mutative String@upcase method ==='
name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

puts "\n=== Output further exploration ==="
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

=begin
  
  Before running the code
  -----------------------
  1. Fluffy
  2. My name is FLUFFY.
  3. FLUFFY
  4. FLUFFY

  Observations
  ------------
    
  The String#to_s method returns itself, which means that the
  'name' instance variable stored in the Pet Class is a
  reference to the exact same string as the local variable
  on line 14.
  
  Also, mutatively upcase the instance variable @name in the 
  instance of the Pet class oirbnce the overriden Pet@to_s method
  is invoked, and since this instance variable is a reference to
  the exact some object in memory than the outer local variable
  'name', both the instance and outer local variable have their
  value, the object they reference in memory mutated to the
  uppercase version.

  This is why after the first invocation of the Pet#to_s method,
  the name always prints in uppercase characters.

  Possible fix
  ------------

  Simply using the non-bang String#upcase method does not mutate
  the instance variable and the outer local variable, but this
  solution still references the same exact object in the Pet name
  instance variable, which may not be a good idea depending on the
  further use of the outer local variable 'name'.

  Before running the code for futher exploration
  ----------------------------------------------

  name = 42
  fluffy = Pet.new(name)
  name += 1
  puts fluffy.name
  puts fluffy
  puts fluffy.name
  puts name

  Observations
  ------------

  Despite the name lvar being an Integer, upon the
  initialization of the Pet class the Integer will
  be stored as String since it is cast to one before
  being assigned to the instance variable 'name'.

  The name += 1 is then re-assignment of the local
  variable, which is just a shortcut for name = name + 1
  and since Integers are stored as immediate values, the
  instance variable is not affected by this re-assignment
  nor is any object ever mutated, the only thing that
  happens is re-mapping of references and objects they
  point to.
  

=end
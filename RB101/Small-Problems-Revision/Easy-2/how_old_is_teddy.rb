=begin
  type:
    - program
  inp:
    - none
  out:
    - String format "Teddy is X years old!"
      where X is random age in range (20..200)

  req:
    exp:

    imp:
      -? 20 and 200 inclusive or exclusive      
      -! including 20 and 200 for now as
         these exercises usually mean inclusive
         with 'between'

  ds and algo:

  - pick random number range (20..200)
  - print string in format with random age

  Further exploration:

  - ask for a name and print random age for that person
  - if not name given use Teddy by default

  ds and algo:

  - ask for name
  - if string given empty override it with 'Teddy'
  - generate random number in range (20..200)
  - print string in the same format using the name
  
=end

print "Enter your name(you don't need to): "
name = gets.chomp 
name = 'Teddy' if name.empty?
age = rand(20..200)
puts "#{name} is #{age} years old!"
=begin

  informal_greeting is a reference to the 'hi' string in the hash
  and the shovel operator mutates the string by adding ' there'
  to it. So the string that is the value for the key :a is 
  modified/mutated.

  So the output is: {:a=>"hi there"}

=end

greetings = { a: 'hi'}
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting 
puts greetings
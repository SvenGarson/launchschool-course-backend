=begin
  type:
    - program
  flow:
    - What is your name? [name]
    if name ends with '!'
      -> - HELLO [NAME]. WHY ARE WE SCREAMING?
    else
      -> Hello [name].

  req:
    exp:

    imp:
      -? capitalize name explicitly or print as user entered it

  ds and algo:

    - get name
    - check if name ends with '!'
      - true  -> 'HELLO .... SCREAMING?'
      - false -> 'Hello name.'

=end

print 'What is your name? '
name = gets
message = case name.end_with?('!')
          when true  then "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
          when false then "Hello #{name}."
          end
puts message
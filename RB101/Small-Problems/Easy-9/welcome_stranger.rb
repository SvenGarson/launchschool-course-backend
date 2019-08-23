=begin
  input:
    args:
      1) array containing >=  2 elements combine to a person's name
      2) hash contains 2 keys as symbols with the appropriate values:
        1. :title 
        2. :occupation

  output:
    return a string, a greeting that uses the person's full name and mentions
    the title together with the occupation

  requirements:
    explicit:
      - method named: greetings
      - include full name and occupation in the string
      - string format:
        'Hello [name1 name2 ... name3]! Nice to have a [title] [occupation] around.'

    implicit:
      n/a

=end

def greetings(name_arr, occup_hsh)
  full_name = name_arr.join(' ')
  full_occup = occup_hsh[:title] + ' ' + occup_hsh[:occupation]
  "Hello, #{full_name}! Nice to have a #{full_occup} around."
end

greeting_1 = greetings(['John', 'Q', 'Doe'], {title: 'Master', occupation: 'Plumber'})
greeting_2 = greetings(%w(James L Chaplin), {title: 'Power', occupation: 'Programmer'})
puts greeting_1
puts greeting_2
=begin
  type:
    - program
  inp:
    - 6 numbers
  out:
    - print whether the last number among the first 5 numbers entered
  flow:
    - ==> Enter the 1st number:
    - gets number
    - ==> Enter the 2nd number:
    - gets number
    - ==> Enter the last number:
    - gets number
    A) The number X appears in [1, 2, 3, 4, 5].
    B) The number X does not appear in [1, 2, 3, 4, 5]

  req:
    expl:
      - 1st, 2nd, 3rd, 4th, 5th, last
    impl:
      -? no validation

  ds and algo:

    Number suffix:
  
      - if number < 10 or > 20
        -> 1st, 2nd, 3rd, 4th, 5th
      - else    
        -> all xth

      where suffix based on the ones place:
      
      1  ) st
      2  ) nd
      3  ) rd
      4-9) th 

    program:
    - list = empty array
    - 6 times 1 through 6
      - if last prompt
        -> suffix = last
      - else
        -> suffix = get_suffix
      - puts ==> Enter the Xsuffix number:
      - list << gets number
    - if last number in first 5
      -> print A
    - else
      -> print B

=end

def suffix(number)
  ones = number % 10
  if number < 10 or number > 20
    case number % 10
      when 1 then 'st'
      when 2 then 'nd'
      when 3 then 'rd'
      else        'th'
    end
  else
    'th'
  end
end

PROMPTS = 6

numbers = []
1.upto(PROMPTS) do |round|
  num_str = (round == PROMPTS) ? "last" : "#{round}#{suffix(round)}"
  puts "Enter the #{num_str} number:"
  numbers << gets.chomp.to_i
end

list_first = numbers[0..-2]
if list_first.include?(numbers.last)
  puts "The number #{numbers.last} appears in #{list_first}."
else
  puts "The number #{numbers.last} does not appear in #{list_first}."
end
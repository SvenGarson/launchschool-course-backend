MAX_VALUES = 6
ORD_1 = 'st'
ORD_2 = 'nd'
ORD_3 = 'rd'
ORD_OTHER = 'th'

def ordinal(number)
  if number < 10 || number > 19
    ones_place = number.to_s.chars.last.to_i
    case ones_place
    when 1 then ORD_1
    when 2 then ORD_2
    when 3 then ORD_3
    else
      ORD_OTHER
    end
  else
    ORD_OTHER
  end
end

array = []

(1..MAX_VALUES).each do |index|
  if index < MAX_VALUES
    puts "Enter the #{index}#{ordinal(index)} number:"
  else
    puts "Enter the last number:"  
  end

  array << gets.chomp.to_i

end

last = array.pop
result = array.include?(last) ? 'appears' : 'does not appear'

puts "The number #{last} #{result} in #{array}."

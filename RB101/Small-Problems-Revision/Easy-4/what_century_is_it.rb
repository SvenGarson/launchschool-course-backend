def century_1(year)
  century = (year / 100.0).floor + ((year % 100) > 0 ? 1 : 0)
  tens_place = century % 100
  ones_place = century % 10

  ordinal = if tens_place < 10 || tens_place > 19
              case ones_place
              when 1 then 'st'
              when 2 then 'nd'
              when 3 then 'rd'
              else
                'th'
              end
            else
              'th'
            end
  century.to_i.to_s + ordinal
end

def ordinal(number)
  tens_ones = number % 100
  if [11, 12, 13].include?(tens_ones)
    'th'
  else
    case tens_ones % 10
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    else        'th'
    end
  end
end

def century_2(year)
  century = (year / 100.0).floor + ((year % 100) > 0 ? 1 : 0)
  "#{century}#{ordinal(century)}"
end

puts '=== Solution A ==='
p century_1(2000) == '20th'
p century_1(2001) == '21st'
p century_1(1965) == '20th'
p century_1(256) == '3rd'
p century_1(5) == '1st'
p century_1(10103) == '102nd'
p century_1(1052) == '11th'
p century_1(1127) == '12th'
p century_1(11201) == '113th'

puts '=== Solution B ==='
p century_2(2000) == '20th'
p century_2(2001) == '21st'
p century_2(1965) == '20th'
p century_2(256) == '3rd'
p century_2(5) == '1st'
p century_2(10103) == '102nd'
p century_2(1052) == '11th'
p century_2(1127) == '12th'
p century_2(11201) == '113th'
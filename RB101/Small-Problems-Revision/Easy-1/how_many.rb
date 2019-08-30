=begin
  inp:
    1) str_ar = array of strings
  out:
    - print line per unique string with it's count:
        format: 'str => count'

  req:
    expl:
      - method named: count_occurrences()
      - handle strings case sensitive
      - expected output for case sesnsitive
        1. car => 4
        2. truck => 3
        3. SUV => 1
        4. motorcycle => 2

  
  ds and algo:
  
  - create array with unique strings
  - iterate curr unique strings:
    - count occur of curr in original
    - print 'string => occurrences'

  further exploration:

  ds and algo -> if case in-sensitive:
    
  -? if multiple one identical word is upcase, downcase or mixed
     which one to actually print then, since no requir, print
     lowercase version

  - new array with lowercase vehicles
  - array containing unique strings
  - iterate each curr in uniq array:
      - count in lowercase array
      - print in format

=end

vehicles = %w(car car truck car SUV truck motorcycle motorcycle car truck)
vehicles2 = %w(SUV suv SuV TRUCK truck TrUcK)

def count_occurrences_case_sens(vehicles)
  vehicles.uniq.each do |vehic|
    puts "#{vehic} => #{vehicles.count(vehic)}"
  end
end

def count_occurrences_case_insens(vehicles)
  vehic_lowercase = vehicles.map { |vehic| vehic.downcase }
  vehic_lowercase.uniq.each do |vehic|  
    puts "#{vehic} => #{vehic_lowercase.count(vehic)}"
  end
end

puts '### Case sensitive ###'
count_occurrences_case_sens(vehicles)
puts '### case sensitive ###'
count_occurrences_case_sens(vehicles2)

puts '### Case in-sensitive ###'
count_occurrences_case_insens(vehicles)
puts '### case in-sensitive ###'
count_occurrences_case_insens(vehicles2)
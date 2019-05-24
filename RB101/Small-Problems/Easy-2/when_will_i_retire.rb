YEAR_CURRENT = Time.now.year

print 'What is your age? '
age_curr = gets.chomp.to_i

print 'At what age would you like to retire? '
age_ret = gets.chomp.to_i
print "\n"

years_to_go = age_ret - age_curr
year_ret = YEAR_CURRENT + years_to_go

puts "It's #{YEAR_CURRENT}. You will retire in #{year_ret}."
puts "You have only #{years_to_go} years of work to go!"
puts "\n"
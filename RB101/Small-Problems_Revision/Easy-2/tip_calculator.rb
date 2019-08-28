print 'What is the bill? '
bill = gets.chomp.to_f

print 'What is the tip percentage? '
percentage = gets.chomp.to_f

tip = bill * (percentage / 100.0)
total = bill + tip

print "\n"
puts format("The tip is $%.2f", tip)
puts format("The total is $%.2f", total)
print "\n"
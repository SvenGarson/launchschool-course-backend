=begin
  type:
    - program
  flow:
    - What is the bill? [bill]
    - What is the tip percentage? [perc]
    -
    - The tip is $X
    - The total is $Y

  req:
    exp:
      - tip percentage in actually percent: 15, 27
    imp:
      -? any rounding desired
      -? no input validation

  ds and algo:

    - prompt -> flow
    - tip = bill * tip_perc / 100
    - total = bill + tip
    - show tip and total

  further exploration:

  - print floating point variables with a precision of 2

=end

print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip_perc = gets.chomp.to_f

amount_tip = bill * tip_perc / 100.0
amount_total = bill + amount_tip

print "\n"
puts format("The tip is $%.2f", amount_tip)
puts format("The total is $%.2f", amount_total)

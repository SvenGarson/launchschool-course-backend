=begin
  type:
    - program
  flow:
    - What is your age? [age]
    - At what age would you like to retire? [age_ret]
    - 
    - It's [current year]. You will retire in [year when retiring].
    - You have only [delta years] years of work to go!

  req:
    expl:
    
    imp:
      -? again no input and range validation
      -? current year as constant ok
      -? consider input as Integers

  ds and algo:

    - prompt for age and what age to retire -> flow
    - compute delta of years to go: [age_ret] - [age]
    - Show result -> flow

  further exploration:

    Use Time class to generate the current year

=end

YEAR_CURRENT = Time.now.year

print 'What is your age? '
age = gets.chomp.to_i
print 'At what age would you like to retire? '
age_ret = gets.chomp.to_i

years_togo = age_ret - age
year_retire = YEAR_CURRENT + years_togo

puts "\nIt's #{YEAR_CURRENT}. You will retire in #{year_retire}."
puts "You have only #{years_togo} years of work to go!"



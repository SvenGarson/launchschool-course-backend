# require both required classes before moving on
# to the next exercise
require_results = Array.new
require_results << require_relative('classes/cash_register.rb',)
require_results << require_relative('classes/transaction.rb')

puts "Both files succesfully required?"
p require_results.all? { |result| result == true}
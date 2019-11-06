class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

p BankAccount.new(250).positive_balance? == true
p BankAccount.new(0).positive_balance? == true
p BankAccount.new(-25).positive_balance? == false

=begin

  Ben is right, this is valid code and it does work as intended.
  
  1. Ruby check whether balance is a keyword, which it is not.
  2. Ruby check if it is variable assignment, which it is not.
  3. Ruby check if it is:
      3.1. Local variable reference, which it is not.
      3.2. Method invocation, which it is!
      
      We invoke the reader / getter method and on that return
      value, which is the local variable @balance, we invoke the
      Integer#>= method and pass it the argument 0, which is the
      final result of the BankAccount#positive_balance? method.

=end
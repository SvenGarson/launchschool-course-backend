require 'minitest/autorun'
require_relative 'classes/cash_register'
require_relative 'classes/transaction'

class CashRegisterTest < Minitest::Test

  def test_prompt_for_payment
    transaction = Transaction.new(50)
    assert(0, transaction.amount_paid)

    input = StringIO.new("50")
    output = StringIO.new()
    
    assert_equal(0, transaction.amount_paid)

    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(50, transaction.amount_paid)
  end

end
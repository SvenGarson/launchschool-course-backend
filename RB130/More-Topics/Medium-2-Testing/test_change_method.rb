require 'minitest/autorun'
require_relative 'classes/cash_register'
require_relative 'classes/transaction'

class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(500)
    transaction = Transaction.new(95)
    transaction.amount_paid = 100

    assert_equal(5, register.change(transaction))
  end
end
require 'minitest/autorun'
require_relative 'classes/cash_register'
require_relative 'classes/transaction'

# test accept money method

class CashRegisterTest < Minitest::Test

  def test_accept_money
    # total_money initially 0?
    register = CashRegister.new(0)
    assert_equal(0, register.total_money)

    # total_money actually incremented?
    transaction = Transaction.new(500)
    transaction.amount_paid = 500

    register.accept_money(transaction)
    assert_equal(500, register.total_money)
  end
end
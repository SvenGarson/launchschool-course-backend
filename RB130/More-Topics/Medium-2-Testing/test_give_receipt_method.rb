require 'minitest/autorun'
require_relative 'classes/cash_register'
require_relative 'classes/transaction'

class CashRegisterTest < Minitest::Test

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    
    expected_output = "You've paid $#{transaction.item_cost}.\n"

    assert_nil(register.give_receipt(transaction))

    assert_output(expected_output) do
      register.give_receipt(transaction)
    end
  end

end
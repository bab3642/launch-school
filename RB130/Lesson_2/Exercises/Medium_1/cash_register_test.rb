require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 55
  end

  def test_accept_money
    previous_amount = @cash_register.total_money
    @cash_register.accept_money(@transaction)
    current_amount = @cash_register.total_money
    assert_equal(155, @cash_register.total_money)
  end

  def test_change
    assert_equal(5, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") { @cash_register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    previous_amount = @transaction.amount_paid
    @transaction.prompt_for_payment(input: StringIO.new("50\n"), output: StringIO.new)
    current_amount = @transaction.amount_paid
    refute_equal(previous_amount, current_amount)
    assert_equal(50, current_amount)
  end
end
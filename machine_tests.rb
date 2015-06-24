require 'minitest/autorun'

require './classes/machine'

# Testing User class methods
class TestMachine < MiniTest::Unit::TestCase
  def setup
    @machine = Machine.new
    @balance = 15000
  end

  #Testing can_withdraw? method from machine.rb
  def test_can_withdraw_positive_equal_to_balance
    assert_equal true, @machine.can_withdraw?(15000)
  end

  def test_can_withdraw_positive_amt_more_than_balance
    assert_equal false, @machine.can_withdraw?(16000)
  end

  def test_can_withdraw_positive_amt_less_than_balance
    assert_equal true, @machine.can_withdraw?(950)
  end

  def test_can_withdraw_negative_amt
    assert_equal false, @machine.can_withdraw?(-50)
  end

  def test_can_withdraw_no_amount_explodes
    assert_raises(ArgumentError) { @machine.can_withdraw?() }
  end

  def test_can_withdraw_not_a_fixnum_explodes
    assert_raises(ArgumentError) { @machine.can_withdraw?('abcd') }
  end

  #Testing deduct method from machine.rb
  #this method cannot be called if `can_withdraw?` is not true, so what should we test about it?
  def test_deduct_positive_value
    @machine.deduct(100)
    assert_equal 900, @balance
  end

end

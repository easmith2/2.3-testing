require 'minitest/autorun'
require_relative '../classes/machine_user'

class DummyClass
  include Withdrawal
  attr_accessor :balance
end

# Test the methods in Withdrawal instead of User or Machine
class TestWithdrawal < MiniTest::Test
  def setup
    @d = DummyClass.new
    @d.balance = 1000
  end

  # Testing can_withdraw? method
  def test_can_withdraw_positive_equal_to_balance
    assert_equal true, @d.can_withdraw?(1000)
  end

  def test_can_withdraw_positive_amt_more_than_balance
    assert_equal false, @d.can_withdraw?(1050)
  end

  def test_can_withdraw_positive_amt_less_than_balance
    assert_equal true, @d.can_withdraw?(950)
  end

  def test_can_withdraw_negative_amt
    assert_equal false, @d.can_withdraw?(-50)
  end

  def test_can_withdraw_no_amount_explodes
    assert_raises (TypeError) { @d.can_withdraw?() }
  end

  def test_can_withdraw_not_a_fixnum_explodes
    assert_raises(TypeError) { @d.can_withdraw?('abcd') }
  end

  # Testing deduct method
  def test_deduct_valid_positive_amt_works
    assert_equal 900, @d.deduct(100)
  end

  def test_deduct_negative_amt_works
    assert_equal 900, @d.deduct(-100)
  end

  def test_deduct_not_a_fixnum_explodes
    assert_raises(TypeError) { @d.deduct("one hundred") }
  end
end

# Testing User class methods
class TestUser < MiniTest::Test
  def setup
    @user = User.new
    @user.balance = 1000
  end

  # Testing that class inclusion of module works
  def test_user_class_instance_can_deduct
    assert_equal 900, @user.deduct(100)
  end
end

# Testing Machine class methods
class TestMachine < MiniTest::Test
  def setup
    @machine = Machine.new
    @machine.balance = 15000
  end

  # Testing that class inclusion of module works
  def test_machine_class_instance_can_deduct
    assert_equal 14900, @machine.deduct(100)
  end

end

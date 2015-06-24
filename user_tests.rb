require 'minitest/autorun'

require './classes/user'

# Testing User class methods
class TestUser < MiniTest::Unit::TestCase
  def setup
    @user = User.new
    @balance = 1000
  end

  # Testing can_withdraw? method from user.rb
  def test_can_withdraw_positive_equal_to_balance
    assert_equal true, @user.can_withdraw?(1000)
  end

  def test_can_withdraw_positive_amt_more_than_balance
    assert_equal false, @user.can_withdraw?(1050)
  end

  def test_can_withdraw_positive_amt_less_than_balance
    assert_equal true, @user.can_withdraw?(950)
  end

  def test_can_withdraw_negative_amt
    assert_equal false, @user.can_withdraw?(-50)
  end

  def test_can_withdraw_no_amount_explodes
    assert_raises(ArgumentError) { @user.can_withdraw?() }
  end

  def test_can_withdraw_not_a_fixnum_explodes
    assert_raises(ArgumentError) { @user.can_withdraw?('abcd') }
  end

  # Testing deduct method from user.rb
  # this method cannot be called if `can_withdraw?` is not true,
  # so what should we test about it?
  def test_deduct_positive_value
    @user.deduct(100)
    assert_equal 900, @balance
  end

end

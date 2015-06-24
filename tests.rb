require './assignment.rb'
require './classes/user'
require './classes/machine'
require 'minitest/autorun'

class TestUser < MiniTest::Unit::TestCase
  def setup
    @user = User.new
    @balance = 1000
  end

  def test_can_withdraw_positive_amt_more_than_balance
    assert_equal false, @user.can_withdraw?(1050)
  end

  def test_can_withdraw_positive_amt_less_than_balance
    assert_equal true, @user.can_withdraw?(950)
  end

  def test_can_withdraw_positive_equal_to_balance
    assert_equal true, @user.can_withdraw?(1000)
  end

  def test_can_withdraw_negative_amt
    assert_equal false, @user.can_withdraw?(-50)
  end

  def test_can_withdraw_no_amount_explodes
    assert_equal false, @user.can_withdraw?()
  end



  # def test_not_passing_an_arg_explodes
  #   assert_raises(ArgumentError) { @dino.eat }
  # end
  #
  # def test_withdrawing_positive_bones
  #   bones_count = @dino.bones
  #   @dino.withdraw_bones(3)
  #   assert_equal(bones_count - 3, @dino.bones)
  # end
  #
  # def test_withdrawing_negative_bones
  #   bones_count = @dino.bones
  #   @dino.withdraw_bones(-3)
  #   assert_equal(bones_count - 3, @dino.bones)
  # end
end

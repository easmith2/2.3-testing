module Withdrawal

  # Verify that the user can withdraw the requested amount
  def can_withdraw?(amt)
    raise TypeError.new('Argument is not numeric') unless amt.is_a? Fixnum
    amt > 0 && self.balance >= amt
  end

  # Update the balance
  def deduct(amt)
    raise TypeError.new('Argument is not numeric') unless amt.is_a? Fixnum
    self.balance -= amt.abs
  end

end


# The User class describes an account holder.
class User
  include Withdrawal

  attr_accessor :name, :pin, :balance

  def initialize
    @name = ""
    @pin = ""
    @balance = 0
  end
end

# The Machine class describes the ATM
class Machine
  include Withdrawal

  attr_accessor :balance
end

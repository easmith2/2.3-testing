require 'minitest/autorun'

require_relative '../classes/program'
require_relative '../classes/machine_user'

# Testing Program class methods
class TestProgram < MiniTest::Test
  def setup
    @atm = Machine.new
    @atm.balance = 12345
    @prog = Program.new(@atm)
    @prog.user = User.new
    @prog.user.balance = 1000
  end

  #Testing run method from program.rb
  def test_run_greeting_and_exit_msgs
    out, _ = capture_io do
      @prog.stub(:get_menu_selection, 3) do
        @prog.run
      end
    end
    assert_match /welcome to atm/i, out
    assert_match /now exiting the atm/i, out
  end

  def test_run_error_when_invalid_menu_entry
    response = {}
    out, _ = capture_io do
      @prog.stub(:get_menu_selection, 10) do
        response = @prog.run
      end
    end
    assert_equal true, response.has_key?(:error)
    assert_match /horribly wrong/i, out
  end

  def test_run_show_atm_balance
    out, _ = capture_io do
      @prog.stub(:get_menu_selection, 2) do
        @prog.run
        @prog.exit_prog = true
      end
    end
    assert_includes out, "This ATM currently has $12345."
  end

  def test_login_to_account_valid_user
    skip "write test later"
    # need more time to figure that out
    # (probably using a mock would help)
  end

  def test_login_to_account_invalid_user
    skip "write test later"
  end

  # Testing exit_prog method from program.rb (seems unnecessary, but whatever)
  def test_exit_prog_true
    @prog.exit_prog = true
    assert_equal true, @prog.exit_prog
  end

  def test_exit_prog_false
    assert_equal false, @prog.exit_prog
  end

  #Testing get_input method from program.rb
  def test_get_input_nonempty_input
    response = ""
    out, _ = capture_io do
      @prog.stub(:chomp, 'testresponse') do
        response = @prog.get_input('testprompt')
      end
    end
    assert_match "testprompt\n>> \n", out
    assert_match "testresponse", response
  end

#
# the following is a complete mess... disregard for now, will
# rewrite all of it (and likely the method being tested) later
#
  #Testing get_login_info method from program.rb
  #create a mock of prog instance
  # def test_get_login_nonempty_input
  #   testhash = {}
  #   mock = MiniTest::Mock.new
  #   Program.stub(:get_input, mock.verify) do
  #     mock.expect(:get_input, 'testname', ['Please enter your name'])
  #     mock.expect(:get_input, 'testpin', ['Please enter your pin'])
  #     testhash = @prog.get_login_info
  #   end
  #   assert_equal( { name: "testname", pin: 'testpin' }, testhash )
  #
  #   out, _ = capture_io do
  #     # @prog.stub(:chomp, 'testname') do
  #     #   testhash[:name] = @prog.get_login_info
  #     # end
  #     # @prog.stub(:chomp, 'testpin') do
  #     #   testhash[:pin] = @prog.get_login_info
  #     # end
  #     @prog.stub(:chomp,'testname', 'testpin') do
  #       testhash = @prog.get_login_info
  #     end
  #     # @prog.stub(:chomp).with('testname', 'testpin') do
  #     #   testhash = @prog.get_login_info
  #     # end
  #   end
  #   assert_match "Please enter your name\n>> \nPlease enter your pin\n>> ", out
  #   assert_equal( { name: "testname", pin: 'testpin' }, testhash )
  # end

  # Testing get_menu_selection method from program.rb
  def test_menu_selection_valid_input
    test_menu = ["1", "2", "3"]
    response = ""
    out, _ = capture_io do
      @prog.stub(:chomp, 3) do
        response = @prog.get_menu_selection(test_menu)
      end
    end
    assert_match "1\n2\n3\n>> ", out
    assert_equal 3, response
  end

  #Testing get_user method from program.rb
  def test_get_user_valid_user
    test_user = {name: "Liz", pin: "5678"}
    out, _ = capture_io do
      @prog.get_user(test_user)
    end
    assert_includes out, "Your account has been verified"
  end

  def test_get_user_invalid_user
    test_user = {name: "Liz", pin: "1111"}
    out, _ = capture_io do
      @prog.get_user(test_user)
    end
    assert_includes out, "Something went wrong. Please start over."
  end

  def test_get_user_null_user
    test_user = {name: nil, pin: nil}
    out, _ = capture_io do
      @prog.get_user(test_user)
    end
    assert_includes out, "Something went wrong. Please start over."
  end

  #Testing display_error method from program.rb
  def test_display_err_msg
    out, _ = capture_io do
      @prog.display_error
    end
    assert_match /tHIS machine/i, out
  end

  #Testing show_acc_menu method from program.rb
  def test_show_acc_menu_invalid_input
    out, _ = capture_io do
      @prog.stub(:get_menu_selection, 10) do
        @prog.show_acc_menu
      end
    end
    assert_includes out, "Something has gone horribly wrong."
  end

  def test_show_acc_menu_opt1_acctbalance
    out, _ = capture_io do
      @prog.stub(:get_menu_selection, 1) do
        @prog.show_acc_menu
      end
    end
    assert_equal "Your current account balance is $1000.".strip, out.strip
  end

#
# need to figure out how to confirm method was called
# without calling it (or just how to bypass the
# subsequent user input requirements of the method called)
#
  # def test_show_acc_menu_opt2_withdraw
  #   out, _ = capture_io do
  #     @prog.stub(:get_menu_selection, 2)
  #       @prog.show_acc_menu
  #     end
  #   end
  #   confirm withdraw_funds method was called?
  # end

#
# following test is displaying acc_menu in the console
# during the test run. need to figure out why
#
  # def test_show_acc_menu_opt3_return_to_main
  #   out, _ = capture_io do
  #     @prog.stub(:get_menu_selection, 3) do
  #       @prog.show_acc_menu
  #     end
  #   end
  #   assert_includes out, "Returning to the Main Menu."
  #   assert_equal false, @prog.show_acc_menu
  # end

  #Testing withdraw_funds method from program.rb
  def test_withdraw_funds
    skip "write test later"
  end

  #Testing parse_data_file method from program.rb
  def test_parse_data_file
    skip "write test later"
  end

  #Testing update_data_file method from program.rb
  def test_update_data_file
    skip "write test later"
  end

end

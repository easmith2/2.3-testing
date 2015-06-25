require 'minitest/autorun'

require '../classes/program'

# Testing Program class methods
class TestProgram < MiniTest::Test
  def setup
    @prog = Program.new(123)
    @balance = 1000
  end

  # #Testing run method from program.rb
  # def test_run_greeting_msg
  #   out, _ = capture_io do
  #     @prog.stub(:get_menu_selection, '3') do
  #       @prog.run
  #       @prog.exit_prog = true
  #     end
  #   end
  #   puts out
  #   assert_match /welcome to atm/i, out
  # end

  # # The following test is from Andrew
  # # I think it's good, it works and is better than I what I tried
  # def test_run_error_when_invalid_menu_entry
  #   response = {}
  #   @prog.stub(:get_menu_selection, 10) do
  #     response = @prog.run
  #   end
  #   assert_equal true, response.has_key?(:error)
  # end

  # #Testing exit_prog method from program.rb (seems unnecessary, but whatever)
  # def test_exit_prog_true
  #   @prog.exit_prog = true
  #   assert_equal true, @prog.exit_prog
  # end
  #
  # def test_exit_prog_false
  #   assert_equal false, @prog.exit_prog
  # end

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

  #Testing get_login_info method from program.rb
  def test_get_login_nonempty_input
    testhash = {}
    # @prog.stub(:chomp, 'testname') do
    #   testhash[:name] = @prog.get_login_info
    # end
    # @prog.stub(:chomp, 'testpin') do
    #   testhash[:pin] = @prog.get_login_info
    # end
    @prog.stub(:chomp).with('testname', 'testpin') do
      testhash = @prog.get_login_info
    end
    assert_equal( { name: "testname", pin: 'testpin' }, testhash )
  end

  #Testing get_menu_selection method from program.rb


  #Testing get_user method from program.rb


  #Testing display_error method from program.rb
  def test_display_err_msg
    out, _ = capture_io do
      @prog.display_error
    end
    assert_match /tHIS machine/i, out
  end

  #Testing show_acc_menu method from program.rb


  #Testing withdraw_funds method from program.rb


  #Testing parse_data_file method from program.rb


  #Testing update_data_file method from program.rb


end

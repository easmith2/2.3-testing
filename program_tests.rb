require 'minitest/autorun'
require 'io/console'

require './classes/program'

# Testing Program class methods
class TestProgram < MiniTest::Unit::TestCase
  def setup
    @prog = Program.new(123)
    @balance = 1000
  end

  #Testing run method from program.rb


  #Testing exit_prog method from program.rb


  #Testing get_input method from program.rb


  #Testing get_login_info method from program.rb


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

require './classes/machine_user'
require './classes/program'

# OK, lets initialize this ATM with a $10,000 balance
atm = Machine.new
atm.balance = 10000


# # This line creates a new instance of the Program.
program = Program.new(atm)

# This executes the program until the user has decided to exit.
program.run until program.exit_prog == true

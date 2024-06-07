begin
  require 'amazing_print'
  AmazingPrint.pry!
rescue LoadError
  puts 'WARNING: There was an attempt to load "amazing_print" gem, but it\'s not installed'
end

# https://github.com/deivid-rodriguez/pry-byebug#matching-byebug-behaviour
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

puts 'Loaded ~/.pryrc'

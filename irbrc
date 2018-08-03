begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
  puts 'WARNING: There was an attempt to load "awesome_print" gem, but it\'s not installed'
end

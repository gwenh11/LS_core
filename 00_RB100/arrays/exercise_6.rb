names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'

=begin
Error message:
TypeError: no implicit conversion of String into Integer
  from (irb):2:in `[]='
  from (irb):2
  from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'
=end

=begin
Atempting to set the value of an item in an array using a string as the key. Index needs to be integer, not string
name[3] = 'jody'
=> ['bob', 'joe', 'susan', 'jody']
=end
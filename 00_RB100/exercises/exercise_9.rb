h = {a:1, b:2, c:3, d:4}

#Get the value of key `:b`.
h[:b]

#2. Add to this hash the key:value pair `{e:5}`
h[:e] = 5

#3. Remove all key:value pairs whose value is less than 3.5
new_h = h.select {|k, v| v < 3.5}

p h
p new_h

=begin
Another method for number 3.
h.delete_if {|k, v| v < 3.5}
=end
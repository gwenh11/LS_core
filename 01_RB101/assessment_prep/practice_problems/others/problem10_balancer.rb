# Write a method that takes a string and returns a boolean indicating if this string has a balanced set of parentheses.
p balancer("(hi") == false
p balancer("(hi)") == true
p balancer("(()) hi") == true
p balancer(")(") == false

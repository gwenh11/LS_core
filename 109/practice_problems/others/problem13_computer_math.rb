# Write a method that converts an english phrase into a mathematical expression, step by step.
p computer("two plus two") == 4
p computer('seven minus six') == 1
p computer('zero plus eight') == 8

# More operations:
p computer('two plus two minus three') == 1
p computer("three minus one plus five minus 4 plus six plus 10 minus 4") == 15

# Compute in order of appearance (not order of operations):
p computer("eight times four plus six divided by two minus two")  # 17, not 33
p computer('one plus four times two minus two') # 8, not 7
p computer('nine divided by three times six') # 18


# Computer using order of operations.
p computer('eight times four plus six divided by two minus two')  # 33
p computer('one plus four times two minus two') # 7
p computer('nine divided by three times six') # 18
p computer('seven plus four divided by two') # 9
p computer('seven times four plus one divided by three minus two') # 26
p computer('one plus four times three divided by two minus two')  # 5
p computer('nine divided by three times six') # 18

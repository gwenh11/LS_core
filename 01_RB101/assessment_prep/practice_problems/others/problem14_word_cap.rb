# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase. You may assume that words are any sequence of non-blank characters.
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Write a method that will generate random English math problems. The method should take a length, then return a math phrase with that many operations.
# Given:
NUMBERS = %w(zero one two three four five six seven eight nine)
OPERATORS = %w(plus minus times divided)
mathphrase(1) # => 'five minus two'  (examples)
mathphrase(2) # => 'two plus three times eight'
mathphrase(3) # => 'one divided by three plus five times zero'

# Write a program that will generate a math problem in English words of any length (random, can use the previous method).

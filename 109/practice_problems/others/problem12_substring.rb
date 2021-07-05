# Write a method that will return a substring based on specified indices.
p substring("honey", 0, 2) #== "hon"
p substring("honey", 1, 2) #== "on"
p substring("honey", 3, 9) #== "ey"
p substring("honey", 2)    #== "n"


# Write a method that finds all substrings in a string, no 1 letter words.
p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']

# Write a method that will return all palindromes within a string.
p palindromes('ppop') == ['pp', 'pop']

# Write a method that finds the longest substring that is a palindrome within a string.
p longest_palindrome("ppop") == 'pop'

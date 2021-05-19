# 3. Counting the Number of Characters

Write a program that will ask a user for  an input of a word or multiple words and give back the number of  characters. Spaces should not be counted as a character.

input:

```plaintext
Please write word or multiple words: walk
```

output:

```plaintext
There are 4 characters in "walk".
```

input:

```plaintext
Please write word or multiple words: walk, don't run
```

output:

```plaintext
There are 13 characters in "walk, don't run".
```

**Solution**

```ruby
puts "Please write word or multiple words:"
input = gets.chomp

# use '\' so that the quotation marks will be interpreted as string
puts "There are #{input.delete(' ').size} character(s) in \"#{input}\"."
```


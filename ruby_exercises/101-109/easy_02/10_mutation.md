# 10. Mutation

What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
```

**Solution**

```ruby
# Output
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
```

On line 3, `each` loop copies all the references from `array1` to `array2`. When this loop completes, both arrays contain the same String objects. If one of those Strings is modified, that modification will show up in both Arrays.

#### Further Exploration

How can this feature of ruby get you in trouble? How can you avoid it?

The problem is both arrays are modified. To avoid this problem and only to modify `array2`, we can use `#dup`

```ruby
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
p array1  # => ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
p array2  # => ["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]
```


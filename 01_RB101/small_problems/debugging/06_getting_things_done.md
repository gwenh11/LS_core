# 6. Getting Things Done

We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking `move` on line 11 results in a `SystemStackError`. What does this error mean and why does it happen?

```ruby
def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
```

#### Further Exploration

What happens if the length of the `from_array` is smaller than `n`?  **`shift` returns the first element removes the element from `from_array`. When the array is empty, `shift`** **returns `nil`, which will be pushed to the `to_array`**

**Solution**

`SystemStackError` is raised in case of stack overflow. In this case, the recursion lacks the base case, which acts as the condition that the execution will stop. In order to know where it needs to return to after finishing each of these calls, Ruby puts each call on a call stack. Since we never stop, this stack keeps growing and growing, until it exceeds its limit. This causes the [`SystemStackError`](https://ruby-doc.org/core/SystemStackError.html) - a real *stack overflow*!

```ruby
def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end
```


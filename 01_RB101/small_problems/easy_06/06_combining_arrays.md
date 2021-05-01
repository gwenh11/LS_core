# Combining Arrays

Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

Example:

```ruby
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
```

**Solution**

```ruby
def merge(arr1, arr2)
  (arr1 + arr2).uniq
end
```

**LS Solution**

```ruby
def merge(array_1, array_2)
  array_1 | array_2
end
```

#### Further Exploration

How did you go about solving this one? Using this method for set union is convenient, but what if we didn't have it? There are certainly a few other ways to go about solving this exercise.
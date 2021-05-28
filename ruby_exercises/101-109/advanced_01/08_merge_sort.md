# Merge Sort

Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array `[9,5,7,1]`. Breaking this down into nested sub-arrays, we get:

```ruby
[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]
```

We then work our way back to a flat array by merging each pair of nested sub-arrays:

```ruby
[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]
```

Examples:

```ruby
merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
```
Hint: Here is a link to some pseudocode and a description of how merge sort works in more detail.

Feel free to use the merge method you wrote in the previous exercise.

**Solution**

Merge sort tutorial: https://www.tutorialspoint.com/data_structures_algorithms/merge_sort_algorithm.htm

```ruby
def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

def merge(arr1, arr2)
  result = []
  tally = {}
  merge = arr1 + arr2

  # build a hash with keys as unique elements in merge array and values as the count of each element in merge array
  merge.each { |value| tally[value] = merge.count(value) }
  # sort all the keys
  keys = tally.keys.sort

  # iterate through keys array, retrieve the value of the key in tally and append the key to result array as many times as the value indicates
  keys.each do |key|
    tally[key].times do 
      result << key
    end
  end
  result
end
```

Merge sort is one of the more efficient sorting algorithms. However, because of its efficiency, it can be a bit difficult to understand (not to say that everything that is efficient is hard to understand). Let's break this down, step by step.

Our solution uses the `merge` method from the previous exercise.

Our method takes the array passed in, and turns it into two smaller arrays. If the size of the original array is even, then we get two even sized arrays. If it is odd, then `sub_array_1` will be odd in size and `sub_array_2` will be even. We do this to break our sorting procedure into smaller, more manageable steps. It doesn't really matter where you put the extra element in odd-sized arrays, so long as you put it in one of the two sub-arrays.

After splitting the array into two sub-arrays, we call ourselves recursively, first on one of the sub-arrays, then on the other. Each of these two calls will sort the subarray by repeating this process until the trivial case of sorting a one-element array is encountered; at this point, we just return that array as-is (it is already sorted).

Once we have the sub-array results, we merge them together using our `merge` method. With each merge, we take two small sub-arrays, and return a larger array that contains all of the elements from both sub-arrays. This repeats at each level until we reach the top level. At this point, the final sorted array is returned to the caller.

```ruby
# Explanation from Jordan Whristler even though I don't understand
@counter = 0
def merge_sort(array)
  p @counter += 1
  p array 
  # <-- [9, 5, 7, 1]
  # <-- [9, 5] [7, 1] (due to line 10 recursion)
  # <-- sub 1 [9] sub 2 [5](due to line 10)

  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1) # sub_array_1 = 9 sub_array_1= [5, 9] 7 
  sub_array_2 = merge_sort(sub_array_2) # sub_array_2 = 5 

  merge(sub_array_1, sub_array_2) #[5, 9] [7, 1]
end

def merge(arr1, arr2)
  result = []
  tally = {}
  merge = arr1 + arr2

  # build a hash with keys as unique elements in merge array and values as the count of each element in merge array
  merge.each { |value| tally[value] = merge.count(value) }
  # sort all the keys
  keys = tally.keys.sort

  # iterate through keys array, retrieve the value of the key in tally and append the key to result array as many times as the value indicates
  keys.each do |key|
    tally[key].times do 
      result << key
    end
  end
  p result
end

merge_sort([9, 5, 7, 1, 3, 12]) #== [1, 5, 7, 9]

# Output
1
[9, 5, 7, 1, 3, 12]
2
[9, 5, 7]
3
[9]
4
[5, 7]
5
[5]
6
[7]
[5, 7]
[5, 7, 9]
7
[1, 3, 12]
8
[1]
9
[3, 12]
10
[3]
11
[12]
[3, 12]
[1, 3, 12]
[1, 3, 5, 7, 9, 12]
```

#### Further Exploration

Every recursive algorithm can be reworked as a non-recursive algorithm. Can you write a method that performs a non-recursive merge sort?


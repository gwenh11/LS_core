# 9. Bubble Sort

Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

|       |       |       |       |       |                            |
| :---- | :---- | :---- | :---- | :---- | :------------------------- |
| **6** | **2** | 7     | 1     | 4     | Start: compare 6 > 2? Yes  |
| **2** | **6** | 7     | 1     | 4     | Exchange                   |
| 2     | **6** | **7** | 1     | 4     | 6 > 7? No (no exchange)    |
| 2     | 6     | **7** | **1** | 4     | 7 > 1? Yes                 |
| 2     | 6     | **1** | **7** | 4     | Exchange                   |
| 2     | 6     | 1     | **7** | **4** | 7 > 4? Yes                 |
| 2     | 6     | 1     | **4** | **7** | Exchange                   |
|       |       |       |       |       |                            |
| **2** | **6** | 1     | 4     | 7     | 2 > 6? No                  |
| 2     | **6** | **1** | 4     | 7     | 6 > 1? Yes                 |
| 2     | **1** | **6** | 4     | 7     | Exchange                   |
| 2     | 1     | **6** | **4** | 7     | 6 > 4? Yes                 |
| 2     | 1     | **4** | **6** | 7     | Exchange                   |
| 2     | 1     | 4     | **6** | **7** | 6 > 7? No                  |
|       |       |       |       |       |                            |
| **2** | **1** | 4     | 6     | 7     | 2 > 1? Yes                 |
| **1** | **2** | 4     | 6     | 7     | Exchange                   |
| 1     | **2** | **4** | 6     | 7     | 2 > 4? No                  |
| 1     | 2     | **4** | **6** | 7     | 4 > 6? No                  |
| 1     | 2     | 4     | **6** | **7** | 6 > 7? No                  |
|       |       |       |       |       |                            |
| **1** | **2** | 4     | 6     | 7     | 1 > 2? No                  |
| 1     | **2** | **4** | 6     | 7     | 2 > 4? No                  |
| 1     | 2     | **4** | **6** | 7     | 4 > 6? No                  |
| 1     | 2     | 4     | **6** | **7** | 6 > 7? No                  |
| 1     | 2     | 4     | 6     | 7     | No swaps; all done; sorted |

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the [Bubble Sort wikipedia page](https://en.wikipedia.org/wiki/Bubble_sort).

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

Examples

```ruby
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
```

#### Further Exploration

Note that we did not use the optimization suggested on the Wiki page that skips looking at tail elements that we know are already sorted. If your solution also skipped this optimization, try modifying your solution so it uses that optimization.

```ruby
# finding the largest elements after length-th pass, then only pass through length - 1 in the inner loop
# optimizing to not look at the last element that is already sorted
def bubble_sort!(arr)
  length = arr.size
  loop do
    swapped = false
    1.upto(length - 1) do |index|
        if arr[index - 1] > arr[index]
          arr[index - 1], arr[index] = arr[index], arr[index - 1]
          swapped = true
        end
    end

    length -= 1
    break unless swapped
  end
  arr
end

# it can happen that more than one element is placed in their final position on a single pass
# In particular, after every pass, all elements after the last swap are sorted, and do not need to be checked again
def bubble_sort!(arr)
  length = arr.size
  loop do
    tail_index = 0
    1.upto(length - 1) do |index|
        if arr[index - 1] > arr[index]
          arr[index - 1], arr[index] = arr[index], arr[index - 1]
          tail_index = index
        end
    end
	# length is assigned to the index of the last sorted element
    # therefore, the next interation only needs to go to length - 1
    # length naturally decreases over time
    # so we need to break the loop when length is <= 1
    length = tail_index
    break if length <= 1
  end
  arr
end
```



**Solution**

```ruby
def bubble_sort!(arr)
  # outer loop repeats the array iteration until arry is sorted
  # meaning there are no elements being swapped
  # we use variable swapped to keep track of this
  # initialize swapped to false, change it to true when elements are swapped
  # breaks the loop when swapped is false
  loop do
    swapped = false
    # inner loop checks every pair of consecutive elements and swapp them when necessary
    0.upto(arr.size - 2) do |index|
        if arr[index] > arr[index + 1]
          arr[index], arr[index + 1] = arr[index + 1], arr[index]
          swapped = true
        end
    end

    break unless swapped
  end
  arr
end
```


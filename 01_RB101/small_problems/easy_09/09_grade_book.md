# 9. Grade book

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

| Numerical Score Letter | Grade |
| :--------------------- | :---- |
| 90 <= score <= 100     | 'A'   |
| 80 <= score < 90       | 'B'   |
| 70 <= score < 80       | 'C'   |
| 60 <= score < 70       | 'D'   |
| 0 <= score < 60        | 'F'   |

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

Example:

```ruby
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
```

**Solution (same as LS)**

```ruby
def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3.0

  case average
  when (90..100) then 'A'
  when (80...90) then 'B'
  when (70...80) then 'C'
  when (60...70) then 'D'
  else                'F'
  end
end
```

**LS Solution**

This takes advantage of the fact that the comparison used by the case statement returns true if the range includes the other object (essentially calling `(range).include?(other_object)`.

You can therefore read it as

```ruby
when (90..100).include?(result)
```

```ruby
GRADE_HASH = { (90..100) => 'A',
               (80..89) => 'B',
               (70..79) => 'C',
               (60..69) => 'D',
               (0..59) => 'F'
              }

def get_grade(num1, num2, num3)
  average = (num1 + num2 + num3)/3

  GRADE_HASH.select do |key, value|
    if key.include?(average)
      return value
    end
  end
end
```

#### Further exploration

How would you handle this if there was a possibility of extra credit grades causing it to exceed 100 points?

**Add the following line to the method**

```ruby
return 'A' if average > 100
```




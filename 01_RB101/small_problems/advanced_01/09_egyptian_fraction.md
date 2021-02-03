# Egyptian Fractions

A [Rational Number](https://en.wikipedia.org/wiki/Rational_number) is any number that can be represented as the result of the division between two integers, e.g., `1/3`, `3/2`, `22/7`, etc. The number to the left is called the numerator, and the number to the right is called the denominator.

A [Unit Fraction](https://en.wikipedia.org/wiki/Unit_fraction) is a rational number where the numerator is `1`.

An [Egyptian Fraction](https://en.wikipedia.org/wiki/Egyptian_fraction) is the sum of a series of distinct unit fractions (no two are the same), such as:

```plaintext
1   1    1    1
- + - + -- + --
2   3   13   15
```

Every positive rational number can be written as an Egyptian fraction. For example:

```plaintext
    1   1   1   1
2 = - + - + - + -
    1   2   3   6
```

Write **two** methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.

Examples:

```ruby
egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
```

Every rational number can be expressed as an Egyptian Fraction. In fact, every rational number can be expressed as an Egyptian Fraction in an infinite number of different ways. Thus, the first group of examples may not show the same values as your solution. They do, however, show the expected form of the solution. The remaining examples merely demonstrate that the output of `egyptian` can be reversed by `unegyptian`.

For more info on Egyptian Fractions, see [this page](http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fractions/egyptian.html).
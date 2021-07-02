# Practice Problems: Medium 1

#### Question 1

Ben asked Alyssa to code review the following code:

```ruby
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
```

Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the `@` before `balance` when you refer to the balance instance variable in the body of the `positive_balance?` method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an `@`!"

Who is right, Ben or Alyssa, and why?

**Solution 1**

Ben is right because he already added an `attr_reader` for the balance instance variable. That means Ruby will automatically create a method called `balance` that returns the value of the `@balance` instance variable. The body of the `positive_balance?` method will evaluate to calling the `balance` method of the class, which will return the value of the `@balance` instance variable. If Ben had omitted the `attr_reader` (or had used an `attr_writer` rather than a reader or an accessor) then Alyssa would be right.

------

#### Question 2

Alan created the following code to keep track of items for a shopping cart application he's writing:

```ruby
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
```

Alyssa looked at the code and spotted a mistake. "This will fail when `update_quantity` is called", she says.

Can you spot the mistake and how to address it?

**Solution 2**

The problem is on line 11. `quantity` is an instance variable, thus must be accessed with the `@quantity` notation when setting it. Otherwise, we create a local variable `quantity` that can be only accessed within method `update_quantity`. 

There is an `attr_reader` defined for quantity, but it is a method for retrieving the value (a "getter") and the setter is undefined. 

There are two possible solutions:

1. change `attr_reader` to `attr_acessor` for `quantity`, and then use the "setter" method like this: `self.quantity = updated_count if updated_count >= 0`.
2. reference the instance variable directly within the `update_quantity` method, like this: `@quantity = updated_count if updated_count >= 0`.

------

#### Question 3

In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

```ruby
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end
```

Alyssa noticed that this will fail when `update_quantity` is called. Since quantity is an instance variable, it must be accessed with the `@quantity` notation when setting it. One way to fix this is to change `attr_reader` to `attr_accessor` and change `quantity` to `self.quantity`.

Is there anything wrong with fixing it this way?

**Solution 3**

It isn't wrong syntactically. However, we are exposing the setter method to the public (user). In other words, you are now allowing clients of the class to change the quantity directly (calling the accessor with the `instance.quantiy = <new value>` notation ) rather than by going through `update_quantity` method. A better solution is to make the writer private:

```ruby
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  private

  attr_writer :quantity
end
```



------

#### Question 4

Let's practice creating an object hierarchy.

Create a class called `Greeting` with a single instance method called `greet` that takes a string argument and prints that argument to the terminal.

Now create two other classes that are derived from `Greeting`: one called `Hello` and one called `Goodbye`. The `Hello` class should have a `hi` method that takes no arguments and prints "Hello". The `Goodbye` class should have a `bye` method to say "Goodbye". Make use of the `Greeting` class `greet` method when implementing the `Hello` and `Goodbye` classes - do not use any `puts` in the `Hello` or `Goodbye` classes.

**Solution 4**

```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```



------

#### Question 5

You are given the following class that has been implemented:

```ruby
class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end
end
```

And the following specification of expected behavior:

```ruby
donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  => "Plain"

puts donut2
  => "Vanilla"

puts donut3
  => "Plain with sugar"

puts donut4
  => "Plain with chocolate sprinkles"

puts donut5
  => "Custard with icing"
```

Write additional code for `KrispyKreme` such that the `puts` statements will work as specified above.

**Solution 5**

```ruby
class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    if filling_type == nil && glazing == nil
      "Plain"
    elsif filling_type == "Vanilla" && glazing == nil
      "Vanilla"
    elsif filling_type == nil && glazing == "sugar"
      "Plain with sugar"
    elsif filling_type == nil && glazing == "chocolate sprinkles"
      "Plain with chocolate sprinkles"
    else
      "#{filling_type} with #{glazing}"
    end
  end
end

# LS Solution
class KrispyKreme
  # ... keep existing code in place and add the below...
  def to_s
    filling_string = @filling_type ? @filling_type : "Plain"
    glazing_string = @glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end
end
```



------

#### Question 6

If we have these two methods in the `Computer` class:

```ruby
class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
```

and

```ruby
class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end
```

What is the difference in the way the code works?

**Solution 6**

There is no difference in the results. 

In the first example, we directly alter the value of the instance variable `@template`, whereas we use the setter via `self.template`.

Both examples show that it isn't needed to prepend `self` to invoke the getter method. In addition, according to the Ruby style guide, we should "Avoid self where not required".

------

#### Question 7

How could you change the method name below so that the method name is more clear and less repetitive?

```ruby
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end
```

**Solution 7**

We can rename the method to just `status`. It is part of the `Light` class, so we don't need to include `light` in the method name. The instance of the class's variable name can be something like `my_light`. It is redundant to have two "light" when invoking the method as `my_light.light_status`.
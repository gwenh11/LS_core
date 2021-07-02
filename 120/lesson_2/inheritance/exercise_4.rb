=begin
  What is the method lookup path and how is it important?

  The method look up path is the order in whifh Ruby travese the hierachy to flook for methods to invoke. 
  For example, say you have a Bulldog object called bud and you call: bud.swim. 
  Ruby will first look for a method called swim in the Bulldog class, then traverse up the chain of super-classes; 
  it will invoke the first method called swim and stop its traversal.
  In our simple class hierarchy, it's pretty straight forward. Things can quickly get complicated in larger libraries or frameworks. 
  To see the method lookup path, we can use the .ancestors class method.
  Bulldog.ancestors       # => [Bulldog, Dog, Pet, Object, Kernel, BasicObject]
=end
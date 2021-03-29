# Topics

Be able to explain clearly the following topics:

- local variable scope, especially how local variables interact with method invocations with blocks and method definitions
  - Local variables that are initialized in an inner scope CANNOT be accessed in the outer scope, but local variables that are initialized in the outer scope CAN be accessed in an inner scope.
  - **Variable shadowing** happens when parameter name of the block is the same as the name of the local variable which was initialized outside of the block. The consequence of the variable shadowing is that it prevents access to variables of the same name initialized outside of the block. 
- how passing an object into a method definition can or cannot permanently change the object
- working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Review the two lessons on these topics thoroughly.
- [variables as pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)
- [puts vs return](https://launchschool.com/books/ruby/read/methods#putsvsreturnthesequel)
- false vs nil and the idea of "truthiness"
- method definition and method invocation
- implicit return value of method invocations and blocks
- how the `Array#sort` method works

Things to remember:

- Methods are defined with parameters, but they are called with arguments.
- 
- `loop` is in `Kernel` module
- Keyword `break` can be used with an argument. If given an argument, the argument is the return value of the terminated block.




# SELECT (Array)
* On `line #`, we call the `select` method on `var_name`, passing in a block as an argument. The `select` method iterates through the collection, passing each element to the block in turn and assigning it to the local variable `block_var_name`. The block is executed once for each element. `select` evaluates the return value of the block, and if the return value of the block evaluates to `true`, it adds the element to a new array. This new array is the return value of the `select` method. 
* In this case, within the block:
  
    * On `line #` ...
* For example, in the first iteration the block returns ...
  
  
### RE-ASSIGNMENT
* On `line _` the local variable `_` is re-assigned to the `Obj_type` `obj_name`.

# DIVIDING
* On `line _` the local variable `_` is re-assigned to the `Obj_type` `obj_name`. The local variable `_` now points to a different object than `other_var`.

# UNITING
* On `line #` the local variable `_` is re-assigned to the `Obj_type` `obj_name` that the local variable `_` is pointing to. Currently, the local variables `_` and `_` both point to the same object. 
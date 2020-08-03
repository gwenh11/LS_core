1. arr = ["b", "a"]
   arr = arr.product(Array(1..3))
   arr.first.delete(arr.first.last)

=begin
arr is reassigned after dot product: [["b",1],["b",2],["b",3],["a",1],["a",2],["a",3]]
arr.first.last => 1
arr.first.delete(1) => 1
the method returns the deleted element of the array which is one
.delete also mutates the caller
arr = [["b"],["b",2],["b",3],["a",1],["a",2],["a",3]]
=end

2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)])
   arr.first.delete(arr.first.last)

=begin
arr after dot product: [["b",[1,2,3]],["a",[1,2,3]]]
arr.first.last => [1,2,3]
arr.first.delete([1,2,3]) => [1,2,3]
return value is [1,2,3]
arr right now is [["b"],["a",[1,2,3]]]
=end
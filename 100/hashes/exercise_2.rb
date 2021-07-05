# The difference between merge and merge! is merge returns a new hash whereas merge! replace the orignal hash with the new hash
# merge! modifies permanently, while merge does not

group_1 = {"a": 100, "b": 200}
group_2 = {"c": 300, "d": 400}

puts group_1.merge(group_2)
puts group_1
puts group_2

puts group_1.merge!(group_2)
puts group_1
puts group_2
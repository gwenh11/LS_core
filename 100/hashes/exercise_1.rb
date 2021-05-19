family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

intermediate_family = family.select {|k,v| k == :sisters || k == :brothers}

# values method returns a new array populated with the values from keys in hash
arr = intermediate_family.values.flatten

p arr
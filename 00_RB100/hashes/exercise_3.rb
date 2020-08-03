hsh = {"a": 100, "b": 200, "c": 300}

hsh.each_key {|k| puts k}
hsh.each_value {|v| puts v}
hsh.each {|k, v| puts "key is #{k} and associated value is #{v}"}

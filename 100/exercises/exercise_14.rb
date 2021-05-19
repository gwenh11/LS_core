a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a = a.map {|word| word.split}
# split methods returns a new array
# result is a multi-dimensional array
# first element 'white snow' becomes ['white, snow'] which is an array

p a

a = a.flatten
# flatten returns a new array that is one-dimensional flattening of self

p a
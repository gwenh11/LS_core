contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts_1 = {"Joe Smith" => {}}

fields = [:email, :address, :phone]

# iterate over contacts, pass string to name, hash to hash.
# Within hash, iternate over fields, pass each array value to field. 
# Assign each field in hash with one element of contact_data
contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift
  end
end

contacts_2 = {"Joe Smith" => {}, "Sally Johnson" => {}}

# use the each_with_index method in the Enumerator class
# the funcion takes the block which is used to initalize the index of the individual objects
# block needs two arguments
contacts.each_with_index do |(name,hash), i|
  fields.each do |field|
    hash[field] = contact_data[i].shift
  end
end

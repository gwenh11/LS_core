def check(string)
  if string =~ /lab/
    puts string
  else
    puts "#{string} doesn't contain 'lab'"
  end
end

check("laboratory")
check("experiment")
check("Pans Labyrinth")
check("elaborate")
check("polar bear")
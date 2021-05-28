# 9. Down the Rabbit Hole

Sometimes, the documentation is going to leave you scratching your head.

In a very early assignment at Launch School, you are tasked with writing a program that loads some text messages from a YAML file. We do this with `YAML::load_file`:

```ruby
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
```

Find the documentation for `YAML::load_file`.



**Solution**

http://ruby-doc.org/stdlib/libdoc/psych/rdoc/Psych.html#method-c-load_file

When going to YAML ruby standard API, there aren't any useful methods, but it states that YAML module is an alias of Psych. Therefore, we go to Psych API and find that `::load_file` is part of Psych. 

load_file(filename, fallback: false)

Load the document contained in `filename`. Returns the yaml contained in `filename` as a Ruby object, or if the file is empty, it returns the specified `fallback` return value, which defaults to `false`.

Use `Psych` class when working with YAML files. 


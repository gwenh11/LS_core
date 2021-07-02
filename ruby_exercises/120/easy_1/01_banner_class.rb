=begin
Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
  end

  def empty_line
  end

  def message_line
    "| #{@message} |"
  end
end
Complete this class so that the test cases shown below work as intended. 
You are free to add any methods or instance variables you need. 
However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+
=end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    '+' + '-' * (@message.size + 2) + '+'
    # alternate solution using string interpolation
    # "| #{' ' * (@message.size)} |"
  end

  def empty_line
    '|' + ' ' * (@message.size + 2) + '|'
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

=begin
Further Exploration
Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. 
The message in the banner should be centered within the banner of that width. 
Decide for yourself how you want to handle widths that are either too narrow or too wide.
=end
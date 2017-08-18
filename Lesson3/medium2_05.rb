puts <<-QA
Q. How could the unnecessary duplication in this method be removed?

A. The method could be one line:
color == "blue" || color == "green"

This will evaluate to true or false, which
will be returned since it is the last value
in the method.

QA

def color_valid(color)
  # if color == "blue" || color == "green"
  #   true
  # else
  #   false
  # end
  color == "blue" || color == "green"
end

puts color_valid('red')
puts color_valid('blue')
puts color_valid('green')

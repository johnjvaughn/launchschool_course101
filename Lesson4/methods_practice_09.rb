puts <<-QA
Q. What is the return value of map in the following code? Why?

A. [nil, 'bear'] because map returns an array with the same size
   as the referenced collection. The first iteration returns
   nil here because 'ant'.size is not > 3, the block
   returns a nil value.  The 2nd iteration, 'bear'.size is
   > 3 so it returns the value, 'bear'.

QA

return_val = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
p return_val
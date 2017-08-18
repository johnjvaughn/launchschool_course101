puts <<-QA
Q. What is the return value of reject in the following code? Why?

A. Return value: [1, 2, 3] because 'reject' returns an array
   containing members for whom the block evaluated to false.
   This block ends with puts which always evaluates to nil which
   is considered a false value.

QA

result = [1, 2, 3].reject do |num|
  puts num
end

p result


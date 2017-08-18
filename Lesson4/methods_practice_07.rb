puts <<-QA
Q. What is the block's return value in the following code? 
   How is it determined? Also, what is the return value of any? 
   in this code. What gets output by this code?

A. The block returns either true or false via the num.odd? 
   invocation.  It will return true for array members 1 and 3,
   false on 2.  The return value of any? will then be true,
   because the block returned a truthy value on at least one
   iteration.  This code outputs each number on a separate line
   via the puts statement.

   CORRECTION: the code will only output number 1 via puts,
   because that first iteration returns truthy. At that point
   any? can quit and return true without doing the other iterations,
   because one truthy value is all it takes to make any? true.

QA

result = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end
p result
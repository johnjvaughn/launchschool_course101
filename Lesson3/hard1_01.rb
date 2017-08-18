puts <<-QA
Q. What do you expect to happen when the greeting variable is 
   referenced in the last line of the code below?

A. The 'greeting' var is uninitialized, so this code
   should throw an error.

CORRECTION: I learned that this code does initialize the
'greeting' var to nil even though the assignment statement
is never executed.

QA

if false
  greeting = “hello world”
end

greeting
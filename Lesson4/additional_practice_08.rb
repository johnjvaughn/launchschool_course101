puts <<-QA
Q. What happens when we modify an array while we are iterating over it? What would be output by this code?

A. In the first code snippet, I think the loop will only run twice. It will run once with number = 1,
   then the numbers array will be shifted so that now the 2nd element is 3.  It runs the 2nd time with number = 3,
   then is shortened again to a two-member array.  The index for the 3rd run would be 3, but there is no
   3rd element, so it quits after printing out 1 and 3.

   In the second code snippet, instead of shifting the array, it pops values off the end. So again it will
   only run twice, but this time will output 1 and 2 since the beginning of the array is no affected right away.

QA

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
puts <<-QA
Q. What is the return value of the following statement? Why?

A. It should return 11, because Array#pop returns the last
   item in the array, and then size returns the length of
   (in this case) that returned string.
   Here, pop returns 'caterpillar' and size then returns 11.

QA

p ['ant', 'bear', 'caterpillar'].pop.size
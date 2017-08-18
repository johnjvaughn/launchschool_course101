puts <<-QA
Q. How does take work? Is it destructive? How can we find out?

A. The Array#take(n) method returns the first n elements of the given array.
   It is non-descructive; we know this because ruby-doc says:
   take(n) --> new_ary
   The 'new_ary' indicates a new array object is created and returned. 
   Running this code also shows the original array stays unaltered.

QA

arr = [1, 2, 3, 4, 5]
p arr.take(2)
p arr
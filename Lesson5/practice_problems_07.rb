puts <<-QA
Q. Given this code, what would be the final values of a and b? 

A. a == 7, b == [-2, 8]
CORRECTION: a == 2, b == [3, 8]
a is an Integer which is immutable. So the statement
arr[0] += 2 reassigns arr[0] to value 4, leaving a == 2.
arr[1][0] -= a reassigns the first element of b, which mutates b to
[3, 8]

QA

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
p a
p b
p arr
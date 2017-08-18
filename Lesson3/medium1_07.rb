puts <<-ANS
A. This should print the number 34, because the
variable 'answer' is passed to the method, but
numbers are immutable in Ruby, so it cannot be
altered as an argument to a method. So in the final
line, answer is still 42 and 'p answer - 8' produces 34.

ANS

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

puts <<-ANS
A. I would give the method a better name that is more
descriptive of what it does. Change the += operator to
a << operator so both operations are destructive.
Better yet, don't mutate 2 arguments at once; better
to mutate them one at a time with a method that
can accept either 1 string or 1 array to append to.
Also, end the method name with a '!' to indicate
it mutates the argument.

ANS

def append_rutabaga!(a_string_or_array)
  a_string_or_array << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
append_rutabaga!(my_string)
append_rutabaga!(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
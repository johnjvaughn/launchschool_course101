puts <<-ANS
A. This will display "pumpkins" for the string, and
["pumpkins", "rutabaga"] for the array.
That's because the += operator reassigns the string
object locally, and the change doesn't affect the original reference
that was passed in to tricky_method.
The << operator on the other hand, is a destructive
method and changes data within the same object, so 
the changes to the original reference do stick.

ANS

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
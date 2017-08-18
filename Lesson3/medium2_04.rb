puts <<-ANS
A. This will display "pumpkinsrutabaga" for the string, and
["pumpkins"] for the array.
That's because the = operator reassigns the array
object locally, and the change doesn't affect the original reference
that was passed in to tricky_method_two.
The << operator on the other hand, is a destructive
method and changes data within the same object, so 
the changes to the original reference do stick.

ANS

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
puts "The result of the following statement will be an error:"
puts %q(puts "the value of 40 + 2 is " + (40 + 2))
puts "Why is this and what are two possible ways to fix this?"
puts

puts "A. 1. Convert 40 + 2 to a string with to_s method:"
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "A. 2. Use string interpolation and put the 40 + 2 within it:"
puts "the value of 40 + 2 is #{(40 + 2)}"
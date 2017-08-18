puts <<-QA
CODE GROUP A.

Answer: Will NOT change any of the variable values.

QA

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

puts <<-QA

CODE GROUP B.

Answer: Will NOT change any of the variable values.

QA

def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars2(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

puts <<-QA

CODE GROUP C.

Answer: WILL change all of the variables
because a destructive method (gsub!) is being
used to alter the contents of the passed
references.
one => "two"
two => "three"
three => "one"

QA

def mess_with_vars3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars3(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"